#version 460 core
out vec4 FragColor;

struct Material{
    sampler2D texture_diffuse;
    sampler2D texture_specular;
    float shininess;
};

struct dirLight{
    vec3 ambient;
    vec3 diffuse;
    vec3 specular;
    vec3 direction;
};

struct pointLight{
    vec3 position;

    float constant;
    float linear;
    float quadratic;

    vec3 ambient;
    vec3 diffuse;
    vec3 specular;
};

struct spotLight{
    vec3 position;
    vec3 direction;

    vec3 ambient;
    vec3 diffuse;
    vec3 specular;

    float cutoff;
    float outercutoff;

    float constant;
    float linear;
    float quadratic;
};

#define PLIGHTNUM 4
uniform Material material;
uniform dirLight dirlight;
uniform pointLight pLight[PLIGHTNUM];
uniform spotLight spotlight;

in VS_OUT {
    vec3 fragPos;
    vec3 normal;
    vec2 TexCoords;
} fs_in;

//in vec2 TexCoords;
//in vec3 normal;
//in vec3 fragPos;

uniform vec3 viewPos;

float near = 0.1;
float far = 100.0;

vec3 calcDirLight(dirLight light, vec3 normal, vec3 viewDir);
vec3 calcPointLight(pointLight light, vec3 normal, vec3 fragPos, vec3 viewDir);
vec3 calcSpotLight(spotLight light, vec3 normal, vec3 fragPos, vec3 viewDir);
float lineariseDepth(float depth);

void main()
{
    vec3 norm = normalize(fs_in.normal);
    vec3 viewDir = normalize(viewPos - fs_in.fragPos);

    vec3 result = calcDirLight(dirlight, norm, viewDir);

    for (int i = 0; i < PLIGHTNUM; i++){
        result += calcPointLight(pLight[i], norm, fs_in.fragPos, viewDir);
    }   

    result += calcSpotLight(spotlight, norm, fs_in.fragPos, viewDir);

    FragColor = vec4(result, 1.0);
    //FragColor = vec4(vec3(gl_FragCoord.z), 1.0);
    //float depth = lineariseDepth(gl_FragCoord.z) / far;
    //FragColor = vec4(vec3(depth), 1.0);
}

vec3 calcDirLight(dirLight light, vec3 normal, vec3 viewDir){
    vec3 lightDir = normalize(-light.direction);

    float diff = max(dot(normal, lightDir), 0.0);

    vec3 reflectDir = reflect(-lightDir, normal);
    float spec = pow(max(dot(viewDir, reflectDir), 0.0), material.shininess);

    vec3 ambient = light.ambient * vec3(texture(material.texture_diffuse, fs_in.TexCoords));
    vec3 diffuse = light.diffuse * diff * vec3(texture(material.texture_diffuse, fs_in.TexCoords));
    vec3 specular = light.specular * spec * vec3(texture(material.texture_specular, fs_in.TexCoords));

    return (ambient + diffuse + specular);
}

vec3 calcPointLight(pointLight light, vec3 normal, vec3 fragPos, vec3 viewDir){
    vec3 lightDir = normalize(light.position - fragPos);
    //diffuse
    float diff = max(dot(normal, lightDir), 0.0);
    //specular
    vec3 reflectDir = reflect(-lightDir, normal);
    float spec = pow(max(dot(viewDir, reflectDir), 0.0), material.shininess);
    //attenuation
    float distance = length(light.position - fragPos);
    float attenuation = 1.0 / (light.constant + light.linear * distance + light.quadratic * (distance * distance));

    vec3 ambient = light.ambient * vec3(texture(material.texture_diffuse, fs_in.TexCoords));
    vec3 diffuse = light.diffuse * diff * vec3(texture(material.texture_diffuse, fs_in.TexCoords));
    vec3 specular = light.specular * spec * vec3(texture(material.texture_specular, fs_in.TexCoords));

    ambient *= attenuation;
    diffuse *= attenuation;
    specular *= attenuation;

    return (ambient + diffuse + specular);
}

vec3 calcSpotLight(spotLight light, vec3 normal, vec3 fragPos, vec3 viewDir){
    vec3 lightDir = normalize(light.position - fragPos);

    float diff = max(dot(normal, lightDir), 0.0);

    vec3 reflectDir = reflect(-lightDir, normal);
    float spec = pow(max(dot(viewDir, reflectDir), 0.0), material.shininess);

    vec3 ambient = light.ambient * vec3(texture(material.texture_diffuse, fs_in.TexCoords));
    vec3 diffuse = light.diffuse * diff * vec3(texture(material.texture_diffuse, fs_in.TexCoords));
    vec3 specular = light.specular * spec * vec3(texture(material.texture_specular, fs_in.TexCoords));

    float distance = length(light.position - fragPos);
    float attenuation = 1.0 / (light.constant + light.linear * distance + light.quadratic * (distance * distance));

    float theta = dot(lightDir, normalize(-light.direction));
    float epsilon = light.cutoff - light.outercutoff;
    float intensity = clamp((theta - light.outercutoff) / epsilon, 0.0, 1.0);

    ambient *= attenuation * intensity;
    diffuse *= attenuation * intensity;
    specular *= attenuation * intensity;

    return (ambient + diffuse + specular);
}

float lineariseDepth(float depth){
    float z = depth * 2.0 - 1.0; // turn z [0,1] into ndc [-1, 1]
    return (2.0 * near * far) / (far + near - z * (far - near));
}
