// **********************************************************************************************************************
//
// Copyright (c)2011, YoYo Games Ltd. All Rights reserved.
//
// File:			testjs.js
// Created:			11/10/2011
// Author:			Mike
// Project:			HTML5
// Description:		Loading bar replacement sample!
//
// Date				Version		BY		Comment
// ----------------------------------------------------------------------------------------------------------------------
// 11/10/2011		V1.0		MJD		1st version.
//
// **********************************************************************************************************************

function Deg2Rad(_deg) { return _deg * (Math.PI / 180.0); }


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
	_graphics.font = "14px Verdana"; ;
	_graphics.textAlign = "center";
	_graphics.fillText(text, x, y);
	_graphics.textAlign = "left";
}


// #############################################################################################
/// Function:<summary>
///          	Draw the "standard" loading bar!
///          </summary>
///
/// In:		<param name="_graphics">Handle to the graphics context</param>
///			<param name="_width">width of canvas</param>
///			<param name="_height">height of canvas</param>
///			<param name="_total">Total number of files being loaded</param>
///			<param name="_current">Current count to have loaded</param>
///			<param name="_loadingscreen">The loading screen "image" handle</param>
///				
// #############################################################################################
function RenderLoadingBar_Standard(_graphics, _width,_height, _total, _current, _loadingscreen) {

	// If we have a loading screen, draw that instead of the loading bar.
	if (_loadingscreen){
		_graphics.drawImage(_loadingscreen, 0, 0, _width, _height);
	} 
	else
	{
		var barwidth = (_width / 100) * 50;				// Loading bar 50% width of screen
		var barheight = 2;                              // Loading bar only 2 pixels high
		var x = (_width - barwidth) / 2;				// center the loading bar
		var y = 10 + (_height - barheight) / 2;			// and the move it down fro the text a little
		var w = (barwidth / _total) * _current;

		// Clear screen
		_graphics.fillStyle = "rgba(21,21,21,255)";
		_graphics.fillRect(0, 0, _width, _height);


		// Only draw the bar once "something" has loaded in.
		if (_current != 0)
		{
			// Draw the dark gray bar
			_graphics.fillStyle = "rgba(64,64,64,255)";
			_graphics.fillRect(x, y, barwidth, barheight);

			// Now draw the loaded files bar over the top.
			_graphics.fillStyle = "rgba(141,143,144,255)";
			_graphics.fillRect(x, y, w, barheight);
		}

		// Finally, draw the text.
		jsDrawCenteredText(_graphics, _width / 2, (_height / 2), "rgba(141,143,144,255)", "Loading");
	}
}




// #############################################################################################
/// Function:<summary>
///          	Draw the "custom" loading bar!
///          </summary>
///
/// In:		<param name="_graphics">Handle to the graphics context</param>
///			<param name="_width">width of canvas</param>
///			<param name="_height">height of canvas</param>
///			<param name="_total">Total number of files being loaded</param>
///			<param name="_current">Current count to have loaded</param>
///			<param name="_loadingscreen">The loading screen "image" handle</param>
///				
// #############################################################################################
function RenderLoadingBar_Custom(_graphics, _width, _height, _total, _current, _loadingscreen) {

	var segments = 270/_total;
	var total = segments*_current;
	var rad = _width;
	if( _width>_height ) rad=_height;


	// Clear screen
	_graphics.fillStyle = "rgba(112,157,213,255)";
	_graphics.strokeStyle = "rgba(0,0,0,0)";
	_graphics.fillRect(0, 0, _width, _height);

	// BLACK outline
	_graphics.beginPath();
	_graphics.lineWidth = 6;
	_graphics.strokeStyle = "rgba(0,0,0,255)";
	_graphics.arc(_width / 2, _height / 2, (rad / 4), 0, Deg2Rad(270), false);
	_graphics.stroke();


	// Gray internal
	_graphics.beginPath();
	_graphics.lineWidth = 4;
	_graphics.strokeStyle = "rgba(255,255,255,255)";
	_graphics.arc( _width/2, _height/2, (rad/4), 0, Deg2Rad(270), false);
	_graphics.stroke();

	// RED loading bar
	_graphics.beginPath();
	_graphics.lineWidth = 4;
	_graphics.strokeStyle = "rgba(255,0,0,255)";
	_graphics.arc( _width/2, _height/2, (rad/4), 0, Deg2Rad(total), false);
	_graphics.stroke();

	// Finally, draw the text. (black outline)
	var x=(_width / 2);
	var y = (_height / 2);
	_graphics.globalAlpha = 1.0;
	jsDrawCenteredText(_graphics, x,  y+1, "rgba(0,0,0,255)",       "Loading");
	jsDrawCenteredText(_graphics, x, y - 1, "rgba(0,0,0,255)", "Loading");
	jsDrawCenteredText(_graphics, x + 1, y, "rgba(0,0,0,255)", "Loading");
	jsDrawCenteredText(_graphics, x - 1, y, "rgba(0,0,0,255)", "Loading");
	jsDrawCenteredText(_graphics, x, y, "rgba(255,255,255,255)", "Loading");
}

