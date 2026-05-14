#version 460 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aNormal;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

uniform vec3 lightcolor;
uniform vec3 lightPos;
uniform vec3 viewPos;

out vec3 lightingColor;

void main(){
    gl_Position = projection * view * model * vec4(aPos, 1.0);
    vec3 fragPos = vec3(model * vec4(aPos, 1.0));  
    vec3 normal = mat3(transpose(inverse(model))) * aNormal; 

    float specularstrength = 1.0;

    float ambientstrength = 0.2;
    vec3 ambient = ambientstrength * lightcolor;

    vec3 norm = normalize(normal);
    vec3 lightDir = normalize(lightPos - fragPos); 

    vec3 viewDir = normalize(viewPos - fragPos); 
    vec3 reflectDir = reflect(-lightDir, norm);

    float spec = pow(max(dot(viewDir, reflectDir), 0.0), 32);
    vec3 specular = specularstrength * spec * lightcolor;

    float diff = max(dot(norm, lightDir), 0.0);
    vec3 diffuse = diff * lightcolor;

    lightingColor = ambient + diffuse + specular;
}
