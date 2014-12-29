/**
	GMS bridge for FGL 1.5.1
	@author YellowAfterlife
	
	Documentation is in format
	function_name(arg1, arg2, ..., argn) : Description
	String arguments are prefixed with "$".
	Functions with string return value are suffixed with "$".
	Internal functions dismiss this format.
	
	Implementation notes:
	GameMaker: Studio uses integer values 0/1 to represent boolean values on
	all targets, including HTML5. This means that you should not, under any
	occasion, pass or return actual boolean values, unless you want to shoot
	extension user in the foot as soon as they'll try to compare the returned
	value with built-in boolean constants (equal to 0/1).
	In addition, GM:S has no built-in mechanism for creating callbacks or events
	from extensions, so that single event implementation is kind of strange.
*/
// Ready:
var fgl_ready = false;
// fgl_is_ready() : Returns whether SDK is ready to start.
function fgl_is_ready() {
	return fgl_ready;
}
function fgl_on_ready() {
	fgl_ready = true;
}

// Conditions:
// fgl_is_cross_enabled() : Returns whether cross-promotion is enabled.
function fgl_is_cross_enabled() {
	return (("fgl" in window) && fgl["crossPromotionEnabled"]) ? 1 : 0;
}
// fgl_is_premium() : Returns whether premium version of game has been unlocked.
function fgl_is_premium() {
	return (("fgl" in window) && fgl["isPremium"]()) ? 1 : 0;
}
// fgl_is_unlock_available() : Returns whether the premium version of the game can be unlocked.
function fgl_is_unlock_available() {
	return (("fgl" in window) && fgl["unlockEnabled"]) ? 1 : 0;
}
// fgl_is_branding_enabled() : Returns whether sponsor branding should be shown.
function fgl_is_branding_enabled() {
	return (("fgl" in window) && fgl["brandingEnabled"]) ? 1 : 0;
}

// IAP event:
var fgl_unlock_succeeded = false, fgl_unlock_failed = false;
// fgl_has_unlock_succeeded() : Returns whether premium version unlocking succeeded.
function fgl_has_unlock_succeeded() {
	return fgl_unlock_succeeded ? 1 : 0;
}
// fgl_has_unlock_failed() : Returns whether premium version unlocking failed.
function fgl_has_unlock_failed() {
	return fgl_unlock_failed ? 1 : 0;
}
function fgl_on_unlock_success() {
	fgl_unlock_succeeded = true;
	fgl_unlock_failed = false;
}
function fgl_on_unlock_failure() {
	fgl_unlock_failed = true;
	fgl_unlock_succeeded = false;
}
// fgl_unlock_initiate() : Show premium unlock process/popup.
function fgl_unlock_initiate() {
	if ("fgl" in window) {
		fgl_unlock_failed = false;
		fgl_unlock_succeeded = false;
		fgl["inApp"]["initiateUnlockFunction"](function() {
			fgl_on_unlock_success();
		}, function() {
			fgl_on_unlock_failure();
		});
	}
}

// fgl_score_submit(score, $leaderboardId) : Submits score to given leaderboard.
function fgl_score_submit(score, board) {
	if ("fgl" in window) {
		if (score < 0) score = -score;
		if (!board) board = "default";
		fgl["submitScore"](score, board);
	}
}

// fgl_score_submit_ext(score, $leaderboardId, name) : Submits score to given leaderboard.
function fgl_score_submit_ext(score, board, name) {
	if ("fgl" in window) {
		if (score < 0) score = -score;
		if (!board) board = "default";
		fgl["submitPlayerScore"](score, name, board);
	}
}

// fgl_score_display($leaderboardId) : Displays given scoreboard.
function fgl_score_display(board) {
	if ("fgl" in window) {
		if (!board) board = "default";
		fgl["displayScoreboard"](board);
	}
}

// fgl_ad_show() : Displays an FGL ad.
function fgl_ad_show() {
	if ("fgl" in window) fgl["showAd"]();
}

// fgl_moregames() : Displays FGL cross-promotion page.
function fgl_moregames() {
	if ("fgl" in window) fgl["showMoreGames"]();
}

// fgl_branding_url()$ : Returns branding logo image URL
function fgl_branding_url() {
	if ("fgl" in window) return fgl["getBrandingLogo"]();
}

// fgl_branding_click() : Should be called when user clicks the branding logo.
function fgl_branding_click() {
	if ("fgl" in window) fgl["handleBrandingClick"]();
}

// fgl_on_init() : Executed automatically on start-up.
function fgl_on_init() {
	if(!("fgl" in window)) {
		window["fgl"] = new window['FGLImplementationTestingSDK']();
	}
	fgl["create"](document.body);
	fgl["onReady"](fgl_on_ready);
	function wrap(f) { return function(e) {
		var o = document.activeElement;
		if (!o || o == document.body || o.tagName == "CANVAS") f.call(this, e);
	}; };
	window.onkeydown = wrap(window.onkeydown);
	window.onkeyup = wrap(window.onkeyup);
}
