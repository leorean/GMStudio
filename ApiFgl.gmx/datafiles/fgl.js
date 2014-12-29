/**
 * FGL SDK - Implement this into your game!
 *
 * Version [DEV]
 *
 * NOTE: This is an implementation testing version of our SDK. When you
 * upload your game to FGL.com, this SDK will be replaced with our real
 * production SDKs (which contain platform-specific functionality). You
 * must not self-publish your app with this version of the SDK implemented,
 * and you must not encrypt or minify this library or our deployment process
 * will fail.
 *
 * For more information see the Implementation Guide or API documentation
 */
 
if(('fgl' in window) == false) {
  window.fgl = window.FGL = window.__fgl = new FGLImplementationTestingSDK();
  if(__fgl.created == false) {
    __fgl.create();
  }
}

/**
 * FGL SDK Class
 * @constructor
 */
function FGLImplementationTestingSDK() {
  "use strict";
  
  var version = '1.5.1';
  var introTitleHtml = 'FGL SDK <small>Game Testing Framework v' + version + '</small>';
  var introHtml = '<p>The Game Testing Framework allows you to test the various FGL SDK features.</p>';
  
  var self = this;
  var htmlStyleContainer = { };   // Fancy html style definitions
  
  // Overlay variables
  self.adOverlay = null;
  self.scoreOverlay = null;
  self.inAppOverlay = null;
  self.imageOverlay = null;
  self.alertOverlay = null;
  
  self.SIZE_300x250 = 1;
  self.SIZE_OVERLAY = 2;

  self.started = false;
  self.created = false;
  self.ready = false;
  self.readyFunctions = [ ];

  self.crossPromotionEnabled = true;
  self.unlockEnabled = true;
  self.brandingEnabled = true;
  
  self.gameId  = 'test';
  self.defaultName = '';
  
  self.htmlHelpers = { };
  
  self.getMeta = function(meta) {
    var metas = document.getElementsByTagName('meta');

    for (var i = 0; i < metas.length; i++) {
      if (metas[i].getAttribute('name') == meta) {
        return metas[i].getAttribute('content');
      }
    }
    return '';
  };

  self.loadScores = function(leaderboardId) {
    var scoresStr = localStorage['lb.' + self.gameId + '.' + leaderboardId];
    if (scoresStr == null || scoresStr == '') {
      return [ ];
    }
    return JSON.parse(scoresStr);
  };

  self.saveScores = function(scores, leaderboardId) {
    while (scores.length > 20) {
      scores.pop();
    }
    localStorage['lb.' + self.gameId + '.' + leaderboardId] = JSON.stringify(scores);
  };

  /**
   * Initialises the API.
   */
  self.create = function() {
    if(self.created == true) { return; }
    
    if(!document.body){
      setTimeout(self.create, 10);
      return;
    }
    
    var gameId = self.getMeta('fgl-gameid');
    if (!gameId) {
      gameId = 'test';
    }
    
    self.gameId = gameId;
    
    // Set up CSS for FGL overlays
    var style = document.createElement('style');
    if (style.styleSheet) {
      style.styleSheet.cssText = htmlStyleContainer.getCss();
    }
    else {
      style.appendChild(document.createTextNode(htmlStyleContainer.getCss()));
    }
    document.head.appendChild(style);
    
    // Is our SDK in 'run mode'?
    if (window.location.hash.substr(0,8) == '#FGLSDK=') {
      // Run!
      var json = decodeURIComponent(window.location.hash.substr(8));
      var sdkSettings = JSON.parse(json);
      window.location.hash = '';
      
      if ('crossPromotionEnabled' in sdkSettings)
        self.crossPromotionEnabled = sdkSettings.crossPromotionEnabled;
        
      if ('unlockEnabled' in sdkSettings)
        self.unlockEnabled = sdkSettings.unlockEnabled;
        
      if ('unlocked' in sdkSettings)
        self.inApp.unlocked = sdkSettings.unlocked;
        
      if ('brandingEnabled' in sdkSettings)
        self.brandingEnabled = sdkSettings.brandingEnabled;
      
      self.boot();
    }
    else {
      
      // Add intro screen
      self.addTestBootScreen();
    }
    
    self.created = true;  // Don't allow create to be called multiple times
  };

  self.boot = function() {
    setTimeout(self.doReadyEvents, 500);
  };

  /**
   * Not currently implemented
   */
  self.reportGameState = function(state) {
    // Placeholder
  };

  /**
   * Not currently implemented
   */
  self.requestQuit = function() {
    // Placeholder
  };

  /**
   * @private
   */
  self.doReadyEvents = function() {
    for (var i = 0; i < self.readyFunctions.length; i++) {
      self.readyFunctions[i]();
    }
    self.ready = true;
  };

  /**
   * Pass your game's initializer functions to this
   * @param {function} f Function to call to begin game
   */
  self.onReady = function(f) {
    if (self.ready) {
      f();
    }
    else self.readyFunctions.push(f);
  };

  /**
   * Displays an advert
   */
  self.show3rdPartyAd = self.showAd = function(options) {
    if (self.ready == false) { self.showNotReadyWarning(); return; } // Do not allow functions to be called if not ready
    if (self.inApp && self.inApp.isUnlocked()) return;
    
    if (self.adOverlay == null)
    {
      var overlay = document.createElement('div');
      overlay.innerHTML = htmlStyleContainer.getImageOverlay('https://reports.fgl.com/sandbox/ads/html5/example_advert.png', 400, 350, 'fgl_overlay_ad');
      document.body.appendChild(overlay);
      self.adOverlay = overlay;
      
      var closeOverlay = function(e) {
        self.stopEventPropagation(e);
        document.body.removeChild(overlay);
        self.adOverlay = null;
      }
      
      self.setupClickEvents('fgl_overlay_ad', closeOverlay);
      
      // Make sure we're vertically centered:
      self.htmlHelpers.checkVerticalCentering();
    }
  };

  /**
   * Submits the given score to the specified leaderboard. If your game
   * only has one leaderboard, do not supply a leaderboardID.
   * @param {Number} score Score to submit
   * @param {string} leaderboardID Name of the leaderboard to show
   */
  self.submitScore = function(score, leaderboardID, extra) {
    var scores = null, holder = null;
    var playerName = '';
    var time = 0;
    var element = null;
    var giveNamePrompt = false;
    
    if (self.ready == false) { self.showNotReadyWarning(); return; } // Do not allow functions to be called if not ready
    
    // Called when the user cancels the score submission:
    var onScoreCancelFunction = function(e) {
      self.stopEventPropagation(e);
      
      // Remove name entry overlay
      document.body.removeChild(holder);
      self.scoreOverlay = null;
    }
    
    // Called when name form is submitted
    var onNameSubmitFunction = function(e) {
      self.stopEventPropagation(e);
      
      // Get the name that was entered
      element = document.getElementById('fgl_scorenameinput');
      if(element != null) {
        playerName = element.value;
      } else {
        playerName = self.defaultName;
      }
      
      // If the player name is invalid, highlight the input box
      if (!playerName) {
        element = document.getElementById('fgl_scorenameinput');
        if(element != null) {
          element.style.border = '1px solid red';
          element.focus();
        }
        return;
      }
      self.defaultName = playerName; // Set the default name for next time
      
      // Remove name entry overlay
      document.body.removeChild(holder);
      self.scoreOverlay = null;
      
      // Get leaderboard scores so we can push score
      leaderboardID = leaderboardID || 'default';
      scores = self.loadScores(leaderboardID);
      time = new Date().getTime();

      // Add the score
      scores.push( {
        score: score,
        player: playerName,
        time: time
      } );

      // Sort the scores list
      scores.sort( function(a, b) {
        if (a.score === b.score) {
          return 0;
        }
        return a.score < b.score ? 1 : -1;
      } );

      // Save and display the newly updated leaderboard
      self.saveScores(scores, leaderboardID);
      self.displayScoreboard(leaderboardID, time);
    }
    
    // Used to submit name form with 'enter' key
    var onNameKeyPress = function(e) {
      if(e.keyCode === 13) { // Enter key
        onNameSubmitFunction(e); // Submit the entered name
      }
    }
    
    // Used to allow focus on name input box
    var onNameSelect = function(e) {
      element = document.getElementById('fgl_scorenameinput');
      if(element != null) {
        element.focus();
      }
    }
    
    // Only add an overlay if there is not one already
    if(self.scoreOverlay == null)
    {
      var showScoreOverlay = function(name) {
        // Add overlay for name entry
        holder = document.createElement('div');
        holder.innerHTML = htmlStyleContainer.getScoreDiv(score, name, 'fgl_overlay_score');
        document.body.appendChild(holder);
        self.scoreOverlay = holder;
        
        element = document.getElementById('fgl_scorenameinput');
        if(element != null) {
          element.value = self.defaultName;
        }
        
        // Set up event listeners
        self.setupClickEvents('fgl_scoresubmitbutton', onNameSubmitFunction);
        self.setupClickEvents('fgl_closebutton', onScoreCancelFunction);
        self.setupClickEvents('fgl_scorenameinput', onNameSelect);
        self.setupClickEvents('fgl_overlay_score', function(e) { self.stopEventPropagation(e); });
        
        // Make sure we're vertically centered:
        self.htmlHelpers.checkVerticalCentering();
      };
      
      // Test if the user is running on the Kindle Fire standard or iOS; use a name prompt on those
      if(navigator.userAgent.search('Silk') != -1 ||
        navigator.userAgent.search('iPod') != -1 || 
        navigator.userAgent.search('iPhone') != -1 ||
        navigator.userAgent.search('iPad') != -1) {
        giveNamePrompt = true;
      }
      
      // Special case on the Kindle Fire standard
      if(giveNamePrompt == true) {
        var providedName = prompt("Enter your name:", self.defaultName);
        
        if(providedName != null) {
          // Check that the name is valid (not all whitespace)
          if(/^\s*$/.test(providedName) == false) {
            self.defaultName = providedName;
            showScoreOverlay(providedName);
          } else {
            self.showDismissableAlert('Invalid name input!', 'Enter a valid name.');
          }
        }
      } else {
        showScoreOverlay();
      }
      
    }
  };
  
  /**
   * Displays the scoreboard UI over your game

   * @param {string} leaderboardID Name of the leaderboard to show
   * @param {Number} highlightScore Index of score in the list to highlight (0 for none)
   */
  self.displayScoreboard = function(leaderboardID, highlightScore) {
    var scores = null;
    var holder = null;
    var html = '';
    var num = 1;
    
    if (self.ready == false) { self.showNotReadyWarning(); return; } // Do not allow functions to be called if not ready
    
    if(self.scoreOverlay == null) {
      leaderboardID = leaderboardID || 'default';
      highlightScore = highlightScore || 0;
      
      html = '<table class="fgl-scoreboard"><tr><th>#</th><th>Name</th>' + 
        '<th>Score</th><th>Date</th></tr>';

      scores = self.loadScores(leaderboardID);
      for (var i in scores) {
        var score = scores[i];
        if (score.time == highlightScore) {
          html += '<tr class="fgl-score-highlight">';
        }
        else {
          html += '<tr>';
        }

        html += '<td>' + (num++) + '</td><td>' + score.player + '</td><td>' +
          score.score + '</td><td>' + new Date(score.time).toLocaleDateString() +
          '</td></tr>';
      }
      html += '</table></div>';
      
      var overlay = document.createElement('div');
      overlay.innerHTML = htmlStyleContainer.createPopup("Leaderboard", html, 'fgl_overlay_leaderboard');
      document.body.appendChild(overlay);
      self.scoreOverlay = overlay;
      
      // Set up event handlers
      self.setupClickEvents('fgl_closebutton', self.hideScoreboard);
      self.setupClickEvents('fgl_overlay_leaderboard', function(e) { self.stopEventPropagation(e); } );
      
      // Make sure we're vertically centered:
      self.htmlHelpers.checkVerticalCentering();
    }
  };

  /**
   * Removes the scoreboard UI from your game
   */
  self.hideScoreboard = function(e) {
    self.stopEventPropagation(e);
    if(self.scoreOverlay == null) {
      return;
    }
    document.body.removeChild(self.scoreOverlay);
    self.scoreOverlay = null;
  };

  /**
   * Grants the specified achievement to the player
   */
  self.grantAchievement = function(achievementId) {
    // Placeholder
  };

  /**
   * Shows a list of achievements with their locked/unlocked states
   */
  self.showAchievements = function() {
    // Placeholder
  };

  /**
   * Returns true if the player has unlocked the specified achievement
   */
  self.hasAchievement = function(achievementId) {
    return false;
  };

  /**
   * Returns true if the app is running in premium (unlocked) mode:
   */
  self.isPremium = function() {
    return self.inApp && self.inApp.isUnlocked();
  };

  /**
   * Gives access to the in app purchasing functions.
   */
  self.inApp = new function() {
    var inApp_self = this;
    var unlocked = false;

    /**
     * Returns true if the app has been unlocked by a payment.
     */
    inApp_self.isUnlocked = function(item) {
      item = item || 'unlock';
      return inApp_self.unlocked || false;
    };

    /**
     * Begins the process of unlocking a game.
     * @param {function} successFunction Function to call on unlock success
     * @param {function} failFunction Function to call on unlock failure
     */
    inApp_self.initiateUnlockFunction = function(successFunction, failFunction) {
      var overlay = null;
      var html = '';
      
      // Do not allow functions to be called if not ready
      if (self.ready == false) { self.showNotReadyWarning(); return; }
      
      // If we're not allowed to unlock, exit early:
      if (self.unlockEnabled === false) return;
      
      // If we're already unlocked, fire the success function and exit:
      if (inApp_self.isUnlocked()) {
        successFunction();
        return;
      }
      
      // Setup our callback functions for our overlay:
      var onInAppOKClick = function(e) {
        self.stopEventPropagation(e);
        inApp_self.unlocked = true;
        try {
          successFunction();
        }
        catch(e) { }
        document.body.removeChild(overlay);
        self.inAppOverlay = null;
      }
      var onInAppCancelClick = function(e) {
        self.stopEventPropagation(e);
        inApp_self.unlocked = false;
        try {
          failFunction();
        }
        catch(e) { }
        document.body.removeChild(overlay);
        self.inAppOverlay = null;
      }
      var onInAppOverlayClick = function(e) {
        self.stopEventPropagation(e);
      }
      
      // Only add an overlay if there isn't one already
      if(self.inAppOverlay == null)
      {
        // Show the unlock overlay:
        overlay = document.createElement('span');
        overlay.innerHTML = htmlStyleContainer.getIapDiv('fgl_overlay_inapp');
        document.body.appendChild(overlay);
        self.inAppOverlay = overlay;
        
        // Hook up the onNameSubmitFunction to the submit button
        self.setupClickEvents('fgl_iapunlockbutton', onInAppOKClick);
        self.setupClickEvents('fgl_iapcancelbutton', onInAppCancelClick);
        self.setupClickEvents('fgl_closebutton', onInAppCancelClick);
        self.setupClickEvents('fgl_overlay_inapp', function(e) { self.stopEventPropagation(e); } );
        
        // Make sure we're vertically centered:
        self.htmlHelpers.checkVerticalCentering();
      }
    }
  };

  /**
   * Displays the "More Games" page
   */
  self.showMoreGames = function() {
    if (self.ready == false) { self.showNotReadyWarning(); return; } // Do not allow functions to be called if not ready
    self.showDismissableImageOverlay('https://reports.fgl.com/sandbox/ads/html5/cross_promo_cover.png', 400, 350);
  };
  
  /**
   * Displays a dismissable centered image overlay - internal use only
   * @private
   */
  self.showDismissableImageOverlay = function(src, width, height) {
    if (self.ready == false) { self.showNotReadyWarning(); return; } // Do not allow functions to be called if not ready
    if (self.imageOverlay == null)
    {
      var overlay = document.createElement('div');
      overlay.innerHTML = htmlStyleContainer.getImageOverlay(src, width, height, 'fgl_overlay_image');
      document.body.appendChild(overlay);
      self.imageOverlay = overlay;
      
      var closeOverlay = function(e) {
        self.stopEventPropagation(e);
        document.body.removeChild(overlay);
        self.imageOverlay = null;
      }
      
      self.setupClickEvents('fgl_overlay_image', closeOverlay);
      
      // Make sure we're vertically centered:
      self.htmlHelpers.checkVerticalCentering();
    }
  }
  
  /**
   * Displays a dismissable centered alert - internal use only
   * @private
   */
  self.showDismissableAlert = function(title, message) {
    if (self.alertOverlay == null)
    {
      var overlay = document.createElement('div');
      var alertHTML = 
        '<p>' + message + '</p>' +
        '<div class="fgl-popup-actions">' +
          '<a class="fgl-popup-button">Dismiss</a>' +
        '</div>';
      overlay.innerHTML = htmlStyleContainer.createPopup(title, alertHTML, 'fgl_overlay_alert');
      document.body.appendChild(overlay);
      self.alertOverlay = overlay;
      
      var closeOverlay = function(e) {
        self.stopEventPropagation(e);
        document.body.removeChild(overlay);
        self.alertOverlay = null;
      }
      
      self.setupClickEvents('fgl_overlay_alert', closeOverlay);
      
      // Make sure we're vertically centered:
      self.htmlHelpers.checkVerticalCentering();
    }
  }

  /**
   * Gets the URI (or data URI) of the branding logo
   * @returns {string} URI or data URI of branding logo
   */
  self.getBrandingLogo = function() {
    return 'http://sites.mpstatic.com/html5/sdks/fgl-branding-placeholder.png';
  };

  /**
   * Call this method when the user clicks or taps on the branding logo
   */
  self.handleBrandingClick = function() {
    if (self.ready == false) { self.showNotReadyWarning(); return; } // Do not allow functions to be called if not ready
    self.showDismissableAlert('Publisher Branding Clicked', 
      'Dynamic publisher branding is now implemented in your game!' +
      '<br /><br />' +
      'Note: This message should only be displayed when you click ' +
      'the <strong>Publisher Branding</strong> placeholder.');
  }
  
  /**
   * Adds the boot screen and event listeners
   * @private
   */
  self.addTestBootScreen = function() {
    var holder = document.createElement('span');
    holder.innerHTML = htmlStyleContainer.getIntroDiv();
    document.body.appendChild(holder);
    
    var handleStartGame = function() {
      /* Magic trick, we put our settings into the URL hash then reload the page.
       * This causes the game to boot from the beginning again, but it will already
       * know the settings.
       */
      var hashString = JSON.stringify({
        crossPromotionEnabled: !document.getElementById('fgl_hideMoreGames').checked,
        unlockEnabled:         !document.getElementById('fgl_hideUnlocks').checked,
        unlocked:              document.getElementById('fgl_unlockGame').checked,
        brandingEnabled:       document.getElementById('fgl_sponsored').checked
      });
      
      var encodedHashString = encodeURIComponent(hashString);
      
      self.started = true;
      
      // Replace intro screen with blank to avoid it looking unresponsive when loading
      if(holder != null) {
        document.body.removeChild(holder);
        holder = document.createElement('span');
        holder.innerHTML = htmlStyleContainer.getEmptyBackgroundDiv();
        document.body.appendChild(holder);
      }
      
      // Get a random query string (nicer than having a big random number in the url)
      var randomQueryString = function() {
        var qs = '';
        var chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';

        while(qs.length < 8) {
          qs += chars.charAt(Math.floor(Math.random() * chars.length));
        }
        return qs;
      };
      
      // Reload, keeping query string
      var url = window.location.href;
      var fglqsIndex = url.indexOf('fglqs=');
      
      if(fglqsIndex != -1) { // If there's an FGL query string, remove that first
        url = url.substr(0, fglqsIndex - 1);
      }
      
      if(url.indexOf('\?') != -1) { // There is a query string
        // Add fglqs to the end of the current query string
        window.location.href = url.split('#')[0] + '&fglqs=' + randomQueryString()
          + '#FGLSDK=' + encodedHashString;
      } else { // No query string
        // Set query string to fglqs
        window.location.href = url.split('#')[0] + '?fglqs=' + randomQueryString() + '#FGLSDK='
          + encodedHashString;
      }
    };
    
    // Set up the start game button
    self.setupClickEvents('fgl_startgamebutton', handleStartGame);
    
    // Make sure we're vertically centered:
    self.htmlHelpers.checkVerticalCentering();
  };
  
  self.showNotReadyWarning = function() {}
  
  /**
   * Do we have an event listener registered yet?
   * @private
   */
  self.htmlHelpers.hasResizeListener = false;
  
  /**
   * Used to vertically center popups:
   * @private
   */
  self.htmlHelpers.verticalCenter = function(element) {
    var topMargin = (window.innerHeight - element.offsetHeight) / 2;
    
    if (topMargin < 0) topMargin = 0;
    element.style.marginTop = topMargin + 'px';
  }
  
  /**
   * Checks the vertical centering of all elements which should be v-centered
   * @private
   */
  self.htmlHelpers.checkVerticalCentering = function() {
    var elements = document.getElementsByClassName('fgl-vcenter');
    for (var i = 0; i < elements.length; i++) {
      self.htmlHelpers.verticalCenter(elements[i]);
    }
    
    // Ensure we have an event listener:
    if (!self.htmlHelpers.hasResizeListener) {
      window.addEventListener('resize',
        self.htmlHelpers.checkVerticalCentering);
        
      window.addEventListener('orientationchange', 
        self.htmlHelpers.checkVerticalCentering);
        
      self.htmlHelpers.hasResizeListener = true;
    }
  }
  
  self.stopEventPropagation = function(e) {
    var ev = e || window.event;
    if(ev == null) { return; }
    
    ev.preventDefault();
    
    if(ev.stopPropagation != null) {
      ev.stopPropagation();
    }
    if(ev.cancelBubble != null) {
      ev.cancelBubble = true;
    }
  }
  
  self.setupClickEvents = function(elementId, handlerFunction) {
    var element = document.getElementById(elementId);
    if(element != null) {
      element.addEventListener('mousedown', handlerFunction, false);
      element.addEventListener('click', handlerFunction, false);
      element.addEventListener('touchstart', handlerFunction, false);
      element.addEventListener('touchend', handlerFunction, false);
    }
  }
  
  /**
   * Get the CSS for the overlays
   * @private
   */
  htmlStyleContainer.getCss = function() {
    var html = '.fgl-popup {' +
      'position: relative;' +

      'max-width: 450px;' +
      'margin: auto;' +
      'border-radius: 4px;' +
      'border: 1px solid #FFF;' +
      'color: #000;' +

      'background-color: #FFF;' +
    '}' +
    
    '.fgl-popup fieldset {' +
      'padding: 5px;' +
    '}' +

    '.fgl-popup-score {' +
      'width: 350px;' +
    '}' +

    '.fgl-popup-head {' +
      'position: absolute;' +
      'border-radius: 3px 3px 0 0;' +

      'top: 0;' +
      'left: 0;' +
      'right: 0;' +
      'height: 44px;' +
      'line-height: 44px;' +
      'padding-left: 12px;' +

      'color: #FFF;' +
      'font-family: Arial, sans-serif;' +
      'font-size: 18px;' +

      'background: #494949;' +
      'background: -moz-linear-gradient(top,  #494949 0%, #373737 100%);' +
      'background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#494949), color-stop(100%,#373737));' +
      'background: -webkit-linear-gradient(top,  #494949 0%,#373737 100%);' +
      'background: -o-linear-gradient(top,  #494949 0%,#373737 100%);' +
      'background: -ms-linear-gradient(top,  #494949 0%,#373737 100%);' +
      'background: linear-gradient(to bottom,  #494949 0%,#373737 100%);' +
      'filter: progid:DXImageTransform.Microsoft.gradient( startColorstr="#494949", endColorstr="#373737",GradientType=0 );' +
    '}' +

    '.fgl-popup-headspacer {' +
      'margin-top: 54px;' +
    '}' +

    '.fgl-popup-subtitle {' +
      'font-family: Arial, sans-serif;' +
      'font-size: 15px;' +
      'text-align: center;' +
      'color: #666;' +
    '}' +

    '.fgl-popup p {' +
      'font-family: Arial, sans-serif;' +
      'font-size: 15px;' +
      'margin: 18px;' +
    '}' +

    '.fgl-popup-scorebox {' +
      'font-family: Arial, sans-serif;' +
      'font-size: 45px;' +
      'text-align: center;' +
      'color: #AB4140;' +
      'font-weight: bold;' +
      'border: 1px solid #DFDFDF;' +
      'margin: 10px 25px;' +
      'overflow: auto;' +
    '}' +

    '.fgl-popup-promptlabel {' +
      'padding: 15px;' +
      'font-size: 14px;' +
      'margin-left: 10px;' +
      'font-family: Arial, sans-serif;' +
    '}' +

    '.fgl-popup-footer {' +
      'padding: 10px;' +
      'margin: 0 15px 15px 15px;' +
    '}' +

    '.fgl-popup-bigfooter {' +
      'padding: 20px;' +
      'margin: 0 15px 15px 15px;' +
      'text-align: center;' +
    '}' +

    '.fgl-popup-prompt {' +
      'font-size: 16px;' +
      'height: 34px;' +
      'line-height: 33px;' +
      'width: 200px;' +
    '}' +

    '.fgl-popup-button {' +
      'padding: 8px 12px;' +
      'margin-left: 10px;' +

      'background: #ab4140;' +
      'background: -moz-linear-gradient(top,  #ab4140 0%, #973a39 100%);' +
      'background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#ab4140), color-stop(100%,#973a39));' +
      'background: -webkit-linear-gradient(top,  #ab4140 0%,#973a39 100%);' +
      'background: -o-linear-gradient(top,  #ab4140 0%,#973a39 100%);' +
      'background: -ms-linear-gradient(top,  #ab4140 0%,#973a39 100%);' +
      'background: linear-gradient(to bottom,  #ab4140 0%,#973a39 100%);' +
      'filter: progid:DXImageTransform.Microsoft.gradient( startColorstr="#ab4140", endColorstr="#973a39",GradientType=0 );' +

      'color: #FFF;' +
      'text-decoration: none;' +
      'font-family: Arial, sans-serif;' +
      'font-weight: bold;' +
      'border-radius: 6px;' +
      'font-size: 15px;' +
      'cursor: pointer;' +
      'white-space: nowrap;' +
    '}' +

    '.fgl-popup-bigbutton {' +
      'padding: 16px 24px;' +
      'margin: auto;' +

      'background: #ab4140;' +
      'background: -moz-linear-gradient(top,  #ab4140 0%, #973a39 100%);' +
      'background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#ab4140), color-stop(100%,#973a39));' +
      'background: -webkit-linear-gradient(top,  #ab4140 0%,#973a39 100%);' +
      'background: -o-linear-gradient(top,  #ab4140 0%,#973a39 100%);' +
      'background: -ms-linear-gradient(top,  #ab4140 0%,#973a39 100%);' +
      'background: linear-gradient(to bottom,  #ab4140 0%,#973a39 100%);' +
      'filter: progid:DXImageTransform.Microsoft.gradient( startColorstr="#ab4140", endColorstr="#973a39",GradientType=0 );' +

      'color: #FFF;' +
      'text-decoration: none;' +
      'font-family: Arial, sans-serif;' +
      'border-radius: 4px;' +
      'font-size: 21px;' +
      'cursor: pointer;' +
      'white-space: nowrap;' +
    '}' +

    '.fgl-popup-actions {' +
      'text-align: right; ' +
      'padding: 0 16px 16px 16px;' +
      'margin-right: -6px;' +
    '}' +

    '.fgl-popup fieldset {' +
      'margin: 16px;' +
      'font-family: Arial, sans-serif;' +
    '}' +

    '.fgl-popup fieldset label {' +
      'display: block;' +
    '}' +

    '.fgl-popup-close {' +
      'float: right;' +
      'color: rgba(255,255,255,0.5);' +
      'text-decoration: none;' +
      'font-size: 30px;' +
      'padding-right: 10px;' +
    '}' +

    '.fgl-popup-close-huge {' +
      'position: fixed;' +
      'top: 10px;' +
      'right: 10px;' +
      'color: rgba(255,255,255,0.5);' +
      'text-decoration: none;' +
      'font-size: 70px;' +
      'padding-right: 20px;' +
    '}' +

    '.fgl-popup-close:hover {' +
      'color: rgba(255,255,255,1);' +
    '}' +
    
    '.fgl-scoreboard {' +
      'border-spacing: 0;' +
      'border-collapse: collapse;' +
      'font-family: Arial, sans-serif;' +
      'width: 100%;' +
      'text-align: left;' +
    '}' +
    
    '.fgl-scoreboard th, .fgl-scoreboard td {' +
      'text-align: left;' +
      'padding: 2px 13px;' +
    '}' +
    
    '.fgl-scoreboard tr {' +
      'border-bottom: 1px solid #EEE;' +
    '}' +
    
    '.fgl-score-highlight td {' +
      'background-color: #FFEE77;' +
    '}' +
    
    '.fgl-image-overlay {' +
      'margin: auto;' +
      'cursor: pointer;' +
    '}' +
    
    '* {' +
      '-webkit-tap-highlight-color: rgba(0,0,0,0);' +
    '}';
    return html;
  }
  
  htmlStyleContainer.getEmptyBackgroundDiv = function() {
    var html = '<div style="position: fixed; top: 0; left: 0; right: 0; bottom: 0; background-color: #000; z-index: 10000;" id="fgl_overlay"></div>';
    return html;
  };
  
  htmlStyleContainer.getIntroDiv = function() {
    var createToggle = function(id){
        return "ontouchstart='this.touchEvent = true;'" + 
                "ontouchend='if(this.touchEvent == true) { document.getElementById(\"" + id + "\").checked = !document.getElementById(\"" + id + "\").checked; } this.touchEvent = false;' " +
                "onclick='if(this.ontouchend){ this.ontouchend = null; return this.touchEvent; } return true;'";
    };
    
    var html = '<div style="position: fixed; top: 0; left: 0; right: 0; bottom: 0; background-color: #000; z-index: 10000;" id="fgl_overlay">' +
      '<div id="popup" class="fgl-popup fgl-vcenter">' +
        '<div class="fgl-popup-head">' + introTitleHtml + '</div>' +
        '<div class="fgl-popup-headspacer"></div>' +
        introHtml +
        '<fieldset>' +
        '<legend>Test Session Options:</legend>' +
        '<label ' + createToggle('fgl_hideMoreGames') + '><input type="checkbox" id="fgl_hideMoreGames"> Disable cross promotion</label>' +
        '<label ' + createToggle('fgl_hideUnlocks')   + '><input type="checkbox" id="fgl_hideUnlocks"> Disable in app upgrade</label>' +
        '<label ' + createToggle('fgl_unlockGame')    + '><input type="checkbox" id="fgl_unlockGame"> Game is premium mode</label>' +
        '<label ' + createToggle('fgl_sponsored')     + '><input type="checkbox" id="fgl_sponsored"> Show sponsor branding</label>' +
        '</fieldset>' +
        '<div class="fgl-popup-bigfooter">' +
          '<a class="fgl-popup-bigbutton" id="fgl_startgamebutton">QA Test Game</a>' +
        '</div>' +
      '</div>' +
      '</div>';
    return html;
  }
  
  htmlStyleContainer.createPopup = function(title, html, id) {
    var overlayId = id || 'fgl_overlay';
    var wrapper = '<div style="position: fixed; top: 0; left: 0; right: 0; bottom: 0; background-color: rgba(0,0,0,0.8); z-index: 10000;" id="' + overlayId + '">' +
      '<div id="popup" class="fgl-popup fgl-vcenter">' +
        '<div class="fgl-popup-head">' +
        title +
        '<a href="#" class="fgl-popup-close" id="fgl_closebutton">&times;</a></div>' +
        '<div class="fgl-popup-headspacer"></div>' +
        html +
      '</div>' +
      '</div>';
    return wrapper;
  }
  
  htmlStyleContainer.getIapDiv = function(id) {
    var overlayId = id || 'fgl_overlay';
    var html = '<div style="position: fixed; top: 0; left: 0; right: 0; bottom: 0; background-color: rgba(0,0,0,0.8); z-index: 10000;" id="' + overlayId + '">' +
      '<div id="popup" class="fgl-popup fgl-vcenter">' +
        '<div class="fgl-popup-head">Example In-App Purchase<a href="#" class="fgl-popup-close" id="fgl_closebutton">&times;</a></div>' +
        '<div class="fgl-popup-headspacer"></div>' +
        '<p>Press \'Unlock\' to simulate a successful in-app purchase, \'Cancel\' otherwise.</p>' +
        '<div class="fgl-popup-actions">' +
          '<a class="fgl-popup-button" id="fgl_iapunlockbutton">Unlock</a>' +
          '<a class="fgl-popup-button" id="fgl_iapcancelbutton">Cancel</a>' +
        '</div>' +
      '</div>' +
      '</div>';
    return html;
  }
  
  htmlStyleContainer.getScoreDiv = function(score, name, id) {
    var overlayId = id || 'fgl_overlay';
    var html = '<div style="position: fixed; top: 0; left: 0; right: 0; bottom: 0; background-color: rgba(0,0,0,0.8); z-index: 10000;" id="' + overlayId + '">' +
      '<div id="popup" class="fgl-popup fgl-popup-score fgl-vcenter">' +
        '<div class="fgl-popup-head">Submit Your Score<a href="#" class="fgl-popup-close" id="fgl_closebutton">&times;</a></div>' +
        '<div class="fgl-popup-headspacer"></div>' +
        '<div class="fgl-popup-subtitle">Your Score</div>' +
        '<div class="fgl-popup-scorebox">' + score + '</div>';
        if(name == null) {
          html += '<label class="fgl-popup-promptlabel">Enter your name:</label>' +
          '<div class="fgl-popup-footer">' +
            '<input type="text" class="fgl-popup-prompt" id="fgl_scorenameinput" maxlength="30">' +
            '<a class="fgl-popup-button" id="fgl_scoresubmitbutton">Submit</a>' +
          '</div>';
        } else {
          html += '<div class="fgl-popup-subtitle">Your name: "' + name + '"</div>' +
          '<div class="fgl-popup-footer" style="text-align: center;">' +
            '<a class="fgl-popup-button" id="fgl_scoresubmitbutton">Submit</a>' +
          '</div>';
        }
      html += '</div></div>';
    return html;
  }
  
  htmlStyleContainer.getImageOverlay = function(src, width, height, id) {
    var overlayId = id || 'fgl_overlay';
    var imgTagAttributes = '';
    if (width) imgTagAttributes += ' width="' + width + '"';
    if (height) imgTagAttributes += ' height="' + height + '"';
    var html = '<div style="position: fixed; top: 0; left: 0; right: 0; bottom: 0; background-color: rgba(0,0,0,0.8); z-index: 10000;" id="' + overlayId + '">' +
      '<a href="#" class="fgl-popup-close-huge" id="fgl_closebutton">&times;</a>' +
      '<div id="image" class="fgl-vcenter" style="text-align: center;">' +
        '<img src="' + src + '" class="fgl-image-overlay" onload="fgl.htmlHelpers.checkVerticalCentering();"' + imgTagAttributes + ' />' +
      '</div>' +
      '</div>';
    return html;
  }
};