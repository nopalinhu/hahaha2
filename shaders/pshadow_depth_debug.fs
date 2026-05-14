#version 460 core
layout (early_fragment_tests) in; // Re-enables early-Z for performance

in vec3 FragPos;
uniform vec3 lightPos;
uniform float far_plane;

void main() {
    float lightDistance = length(FragPos - lightPos);
    // Clamp to [0,1] and store linear depth
    gl_FragDepth = clamp(lightDistance / far_plane, 0.0, 1.0);
}