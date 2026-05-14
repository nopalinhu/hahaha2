#version 460 core

out vec4 FragColor;

in vec3 normal;
in vec3 position;

uniform vec3 camPos;
uniform samplerCube skybox;
uniform int mode;

vec4 refraction();
vec4 reflection();

void main(){
    if (mode == 1)
        FragColor = reflection();
    else if (mode == 2)
        FragColor = refraction();
}

vec4 refraction(){
    float ratio = 1.0 / 1.52;
    vec3 I = normalize(position - camPos);
    vec3 R = refract(I, normalize(normal), ratio);
    return vec4(texture(skybox, R).rgb, 1.0);
}

vec4 reflection(){
    vec3 I = normalize(position - camPos);
    vec3 R = reflect(I, normalize(normal));
    return vec4(texture(skybox, R).rgb, 1.0);
}
