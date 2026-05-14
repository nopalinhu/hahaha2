#version 460 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aNormal;

layout (std140) uniform matrices{
    uniform mat4 view;
    uniform mat4 projection;
};

out vec3 normal;
out vec3 position;


uniform mat4 model;

void main(){
    normal = mat3(transpose(inverse(model))) * aNormal;
    position = vec3(model * vec4(aPos, 1.0));
    gl_Position = projection * view * vec4(position, 1.0);
    gl_PointSize = gl_Position.z;
}
