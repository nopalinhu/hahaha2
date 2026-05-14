#version 460 core
layout (location = 0) in vec3 aPos;
uniform mat4 model;

// Pass world position explicitly instead of abusing gl_Position
out vec3 WorldPos;

void main() {
    WorldPos = vec3(model * vec4(aPos, 1.0));
    // gl_Position can be anything here since GS overrides it, 
    // but keeping it in world space with w=1.0 is safe.
    gl_Position = vec4(WorldPos, 1.0);
}