#version 460 core

out vec4 FragColor;
in vec2 TexCoords;

uniform sampler2D ourTexture;
uniform sampler2D ourTexture1;
uniform vec4 color;


void main()
{
    /*FragColor = mix(texture(ourTexture, TexCoord), 
                    texture(ourTexture1, TexCoord), 0.3);*/
    FragColor = texture(ourTexture, TexCoords);
}
