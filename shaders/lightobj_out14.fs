#version 460 core

struct Material{
    vec3 ambient;
    vec3 diffuse;
    vec3 specular;
    float shininess;
};

struct Light{
    vec3 ambient;
    vec3 diffuse;
    vec3 specular;
    vec3 position;
};

uniform Material material;
uniform Light light;

in vec3 normal;
in vec3 fragPos;
out vec4 FragColor;

uniform vec3 lightcolor;
uniform vec3 objcolor;
uniform vec3 lightPos;
uniform vec3 viewPos;

void main()
{
    //AMBIENT
    //float ambientstrength = 0.2;
    vec3 ambient = light.ambient * material.ambient;

    //DIFFUSE
    vec3 norm = normalize(normal);
    vec3 lightDir = normalize(light.position - fragPos); 
    float diff = max(dot(norm, lightDir), 0.0);
    vec3 diffuse = light.diffuse * (diff * material.diffuse);

    //SPECULAR
    vec3 viewDir = normalize(viewPos - fragPos); 
    vec3 reflectDir = reflect(-lightDir, norm);
    //float specularstrength = 0.5;
    float spec = pow(max(dot(viewDir, reflectDir), 0.0), material.shininess);
    vec3 specular = light.specular * (spec * material.specular);

    vec3 result = ambient + diffuse + specular;
    FragColor = vec4(result, 1.0);
}
