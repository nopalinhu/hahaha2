#version 460 core
out vec4 FragColor;

uniform vec3 color;

void main()
{
    FragColor = vec4(color/*0.69, 0.81, 0.8*/, 1.0);
}
