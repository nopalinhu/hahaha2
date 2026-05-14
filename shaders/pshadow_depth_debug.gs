#version 460 core
layout (triangles) in;
layout (triangle_strip, max_vertices = 18) out;

uniform mat4 shadowMatrices[6];
in vec3 WorldPos[]; // Matches VS output
out vec3 FragPos;   // Use vec3, we only need xyz for distance

void main() {
    for (int face = 0; face < 6; ++face) {
        gl_Layer = face;
        for (int i = 0; i < 3; ++i) {
            FragPos = WorldPos[i];
            gl_Position = shadowMatrices[face] * vec4(WorldPos[i], 1.0);
            EmitVertex();
        }
        EndPrimitive();
    }
}