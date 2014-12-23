// **********************************************************************************************************************
// File:			FMS_loading.js
// Created:			08/11/2014
// Author:			FM Studio (modification of Mike's extension - YoYoGames)
// Project:			HTML5
// Description:		Make a nice loading screen and bar!
// Date				Version		BY		Comment
// ----------------------------------------------------------------------------------------------------------------------
// 30/07/2014		V2.0		FMS		1st version.
//
// **********************************************************************************************************************
///In:<param name="_graphics">Handle to the graphics context</param>
///<param name="_width">800</param>
///<param name="_height">480</param>
///<param name="_total">Total number of files being loaded</param>
///<param name="_current">Current count to have loaded</param>
///<param name="_loadingscreen">"preloader.png"</param>

function custom_preloader(_graphics, _width, _height, _total, _current, _loadingscreen) {

var w = 2*400;
var h = 2*240;

//###############################################################
//##EDIT THE FOLLOWING FIELDS TO CUSTOMIZE YOUR LOADING SCREEN ##
//###############################################################
//////////////////////  Settings for TEXT //////////////////////
		var loading_text="Loading...";						//loading text
		var text_style="20px Arial";						//font style of loading text
		var align_text="center";							//loading text alignment
		var loading_text_color="rgb(215, 40, 40)";			//text color in rgb
		var text_x_pos= (w/2);							//text orizontal position: use (_width/2) to center
		var text_y_pos= 550;								//text vertical position: use (_height/2) to center
//////////////////////  LOADING BAR SETTINGS ////////////////////////////////	
		var barwidth = (w - 50) ;					//Loading bar width in pixel, use (_width / 100) * 50 to have a bar 50% width of screen
		var barheight = 25;                          	// Loading bar height in pixel
		var x = (w - barwidth) / 2;				// Loading bar orizizontal position (in example centered orizontally)
		var y = 150 + (h - barheight) / 2;		// Loading bar vertical position (in example moved 150px down from center)
		var d = (barwidth / _total) * _current;         //variable to calculate width during loading progress, DON'T EDIT
		var border=10   								// Bar border width in pixel
		var border_color= "rgb(0,255,0)";   			//Bar border color in rgb
		var bar_bg= "rgb(64,64,64)";   					//Bar Background color 
		var progress_bg= "rgb(215, 40, 40)";  			//Progress Bar color
///////////////////// BACKGROUND SETTINGS   ///////////////////////////////////
		var window_bgd="rgb(255,255,0)"; 				//Background color 
		var ls_height= h;						//Loading Screen image height in pixel (use _height to fit canvas)
		var ls_width= w;						//Loading Screen image width in pixel (use _width to fit canvas)
		var ls_y_pos=0;   							//Loading Screen image vertical position 
		var ls_x_pos=0;  							//Loading Screen image orizontal position 
//////////////////// CUSTOM IMAGE SETTINGS TO BE USED INSTEAD OR TOGETHER GM:S LOADING SCREEN, LEAVE URL EMPTY IF NOT NEEDED		
		var customlogo = new Image();				//variable creation, DON'T EDIT
		customlogo.src = "http://www.fm-studio.net/images/urlIMAGE.png"; 						//URL to custom image, leave empty in not needed
		var imgheight= 200;							//custom image height in pixel (use _height to fit canvas)
		var imgwidth= 300;							//custom image width in pixel (use _width to fit canvas)
		var fromtop=((h - imgheight)/2);  	//custom image vertical position (centered in example)
		var fromside=((w - imgwidth)/2);  		//custom image orizontal position (centered in example)

// #############################################################################################
/// Function:<summary>
///          	Simple function to center some text
///          </summary>
///
/// In:		<param name="_graphics">2D Graphics context</param>
/// In:		<param name="x">X coordinate</param>
///			<param name="y">Y coordinate</param>
///			<param name="colour">Colour of text</param>
///			<param name="text">text to draw!</param>
///				
// #############################################################################################
function jsDrawCenteredText(_graphics, x, y, colour, text) {
	_graphics.fillStyle = colour;
	_graphics.lineStyle = colour;
	_graphics.font = text_style; 
	_graphics.textAlign = align_text;
	_graphics.fillText(text, x, y);
}
		//Color the background 
		_graphics.fillStyle = window_bgd;
		_graphics.fillRect(0, 0, _width, _height);
		
		//If GM splashscreen is set use it, and make it same width and height as canvas, start drawing at x=0 and y=0
		if (_loadingscreen){
		_graphics.drawImage(_loadingscreen, ls_x_pos, ls_y_pos, ls_width, ls_height);
	} 
	//If custom image is set use it, and make it same width and height as canvas, start drawing at x=0 and y=0

	if  (customlogo.src!="") {
	_graphics.drawImage(customlogo, fromside, fromtop, imgwidth, imgheight);
	}

		// Only draw the bar once "something" has loaded in.
		if (_current != 0)
		{
			//Border
			_graphics.fillStyle = border_color;  /////////////////////
		    _graphics.fillRect(x-border, y-border, barwidth+(border*2), barheight+(border*2));///////////////////

			
			// BAr Background
			_graphics.fillStyle = bar_bg;
			_graphics.fillRect(x, y, barwidth, barheight);

			// Progress Bar
			_graphics.fillStyle = progress_bg;
			_graphics.fillRect(x, y, d, barheight);
//		}

		// Finally, draw the text.
		jsDrawCenteredText(_graphics, text_x_pos, text_y_pos, loading_text_color, loading_text);
		
	}

}
