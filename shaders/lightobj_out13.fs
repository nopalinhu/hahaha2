#version 460 core

in vec3 normal;
in vec3 fragPos;
out vec4 FragColor;

uniform vec3 lightcolor;
uniform vec3 objcolor;
uniform vec3 lightPos;
uniform vec3 viewPos;

void main()
{
    float specularstrength = 0.5;

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

    vec3 result = (ambient + diffuse + specular) * objcolor;
    FragColor = vec4(result, 1.0);
}
