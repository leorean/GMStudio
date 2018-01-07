//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;

    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~





//
// Outline shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float pixelWidth;
uniform float pixelHeight;
void main()
{
  // Compute the textel offsets
  vec2 offsetX;
  offsetX.x = pixelWidth;
  vec2 offsetY;
  offsetY.y = pixelHeight;
  
  float originAlpha = sign(texture2D(gm_BaseTexture, v_vTexcoord).a);
  float alpha = originAlpha;
  // Combine the alpha from all surrounding textels. 
  alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord + offsetX).a);
  alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord - offsetX).a);
  alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord + offsetY).a);
  alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord - offsetY).a);  
  
  // Only blend with the image_blend factor if the original alpha was 0. 
  // That means the image_blend parameter is the outline color. 
  gl_FragColor = (v_vColour * (1.0 - originAlpha)) + 
                 texture2D(gm_BaseTexture, v_vTexcoord);
  
  // Use the computed alpha
  gl_FragColor.a = alpha;
}
