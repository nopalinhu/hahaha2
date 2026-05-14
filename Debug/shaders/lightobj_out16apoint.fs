#version 460 core
out vec4 FragColor;

struct Material{
    sampler2D diffuse;
    sampler2D specular;
    //sampler2D emission;
    float shininess;
};

struct Light{
    vec3 ambient;
    vec3 diffuse;
    vec3 specular;

    vec3 direction; // for directional lighting
    vec3 position;

    float constant;
    float linear;
    float quadratic;
};

uniform Material material;
uniform Light light;

in vec2 TexCoords;
in vec3 normal;
in vec3 fragPos;

uniform vec3 lightcolor;
uniform vec3 objcolor;
uniform vec3 lightPos;
uniform vec3 viewPos;

void main()
{
    //AMBIENT
    vec3 ambient = light.ambient * vec3(texture(material.diffuse, TexCoords));

    //DIFFUSE
    vec3 norm = normalize(normal);
    vec3 lightDir = normalize(light.position - fragPos);//(-light.direction); (light.position - fragPos); 
    float diff = max(dot(norm, lightDir), 0.0);
    vec3 diffuse = light.diffuse * diff * vec3(texture(material.diffuse, TexCoords));

    //SPECULAR
    vec3 viewDir = normalize(viewPos - fragPos); 
    vec3 reflectDir = reflect(-lightDir, norm);
    float spec = pow(max(dot(viewDir, reflectDir), 0.0), material.shininess);
    vec3 specular = light.specular * spec * vec3(texture(material.specular, TexCoords));

    float distance = length(light.position - fragPos);
    float attenuation = 1.0 / (light.constant + light.linear * distance + light.quadratic * (distance * distance));

    ambient *= attenuation;
    diffuse *= attenuation;
    specular *= attenuation;
    
    //vec3 emission = vec3(texture(material.emission, TexCoords));
    
    vec3 result = ambient + diffuse + specular;
    FragColor = vec4(result, 1.0);
}
