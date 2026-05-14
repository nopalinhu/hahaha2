#version 460 core

out vec4 FragColor;
in vec3 lightingColor;

uniform vec3 objcolor;


void main()
{
    
    FragColor = vec4(objcolor * lightingColor, 1.0);
}
