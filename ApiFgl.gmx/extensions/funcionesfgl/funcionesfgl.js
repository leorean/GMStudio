function showAd() 
{
  fgl.showAd();
}

function showMoreGames()
{
if(fgl.crossPromotionEnabled)
{
fgl.showMoreGames();
}
}

function addbranding()
{
if (fgl.brandingEnabled)
{
var cadena = fgl.getBrandingLogo();
return cadena;
}
}


function addbrandingdirection()
{
if (fgl.brandingEnabled)
{
fgl.handleBrandingClick();
}
}