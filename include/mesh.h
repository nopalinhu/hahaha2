#ifndef MESH_H
#define MESH_H

#include <iostream>
#include <vector>
#include <glad/glad.h>
#include <GLFW/glfw3.h>
#include <shader.h>
#include <glm/glm.hpp>
#include <glm/gtc/type_ptr.hpp>
#include <glm/gtc/matrix_transform.hpp>

struct Vertex {
	glm::vec3 position;
	glm::vec3 normal;
	glm::vec2 TexCoords;
};

struct mTexture {
	unsigned int id;
	std::string type;
	std::string path;
};

class Mesh
{
public:
	std::vector<Vertex> vertices;
	std::vector<unsigned int> indices;
	std::vector<mTexture> textures;

	Mesh(std::vector<Vertex> vertices, std::vector<unsigned int> indices,
		std::vector<mTexture> textures);
	void Draw(Shader& shader);

	unsigned int VAO, VBO, EBO;
private:
	void setupMesh();
};

#endif
