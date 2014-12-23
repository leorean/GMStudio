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
	_graphics.font = "48px Verdana";
	_graphics.textAlign = "center";
	_graphics.fillText(text, x, y);
	_graphics.textAlign = "left";
}

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
function custom_preloader(_graphics, _width, _height, _total, _current, _loadingscreen)
{
	//////////////////////  LOADING BAR SETTINGS ////////////////////////////////	
	/*var barwidth = (_width - 50) ;					
	var barheight = 25;                          	
	var x = (_width - barwidth) / 2;				
	var y = (_height - barheight) / 2;
	var w = (barwidth / _total) * _current;
	var percent = Math.floor(100 * (_current / _total));
	var border=3;   						
	var border_color= "rgb(102,79,52)";   	
	var bar_bg= "rgb(0,0,0)";   			
	var progress_bg= "rgb(226,174,85)";
	*/
	var percent = Math.floor(100 * (_current / _total));
	
	var load_bg = new Image();
	load_bg.src = '../html5game/loader_bg.png';
	//var load_fg = new Image();
	//load_fg.src = '../html5game/loader_fg.png';
	
	//Color the background 
	//_graphics.fillStyle = window_bgd;
	//_graphics.fillRect(0, 0, _width, _height);
	
	//If GM splashscreen is set use it, and make it same width and height as canvas, start drawing at x=0 and y=0
	/*if (_loadingscreen != 0)
	{
		_graphics.drawImage(_loadingscreen, 0, 0, _width, _height);
	}*/
	//var s = 0;
	//s += 1;
	_graphics.drawImage(load_bg, 0,0);
	//_graphics.drawImage(load_fg, s % (_width + 80),80,80,48);

	// Only draw the bar once "something" has loaded in.
	if (true)//_current != 0)
	{
		/*
		//Border
		_graphics.fillStyle = border_color;  /////////////////////
		_graphics.fillRect(x-border, y-border, barwidth+(border*2), barheight+(border*2));///////////////////

		
		// Bar Background
		_graphics.fillStyle = bar_bg;
		_graphics.fillRect(x, y, barwidth, barheight);

		// Progress Bar
		_graphics.fillStyle = progress_bg;
		_graphics.fillRect(x, y, w, barheight);*/
		
		var x = 200;
		var y = _height/2;
		var b = 2;
		var s = 3;
		var a = 10;

		
		_graphics.fillStyle = "rgb(0,0,0)";
		_graphics.fillRect(x-b,y-b,_width - 2*x + 2*b,s*a + 2*b);

		_graphics.fillStyle = "rgb(255,255,255)";
		_graphics.fillRect(x,y,_width - 2*x,s*a);

		
		//for (var i = 0; i < _width*(percent/100); i+= 1)
		for (var j = 0; j < a; j+= 1)
		{
			_graphics.fillStyle = "hsl("+j*25+",100%,50%)";
			_graphics.fillRect(x,y+j*s,(_width - 2*x) * (_current / _total),s);
		}
		
		jsDrawCenteredText(_graphics, _width/2, _height/2 - 35, "rgb(0,0,0)", percent + "%");
		jsDrawCenteredText(_graphics, _width/2, _height/2 + 70 + s*a, "rgb(0,0,0)", "Game is loading..");
		
	}
}

