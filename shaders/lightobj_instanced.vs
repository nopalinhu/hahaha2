#version 460 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aNormal;
layout (location = 2) in vec2 aTexCoord;
layout (location = 3) in mat4 instanceMatrix;

layout (std140) uniform matrices{
    uniform mat4 view;
    uniform mat4 projection;
};

out VS_OUT {
    vec3 fragPos;
    vec3 normal;
    vec2 TexCoords;
    vec4 fragPosLightSpace;
} vs_out;

uniform mat4 LightSpaceMatrix;

void main(){
    gl_Position = projection * view * instanceMatrix * vec4(aPos, 1.0);
    vs_out.fragPos = vec3(instanceMatrix * vec4(aPos, 1.0));
    vs_out.normal = mat3(transpose(inverse(instanceMatrix))) * aNormal;
    vs_out.TexCoords = aTexCoord;
    vs_out.fragPosLightSpace = LightSpaceMatrix * vec4(vs_out.fragPos, 1.0);
}
