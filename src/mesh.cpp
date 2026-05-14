#include <iostream>
#include <vector>
#include <glad/glad.h>
#include <GLFW/glfw3.h>
#include <shader.h>
#include <mesh.h>
#include <texture.h>
#include <glm/glm.hpp>
#include <glm/gtc/type_ptr.hpp>
#include <glm/gtc/matrix_transform.hpp>

Mesh::Mesh(std::vector<Vertex> vertices, std::vector<unsigned int> indices,
	std::vector<mTexture> textures) {
	this->vertices = vertices;
	this->indices = indices;
	this->textures = textures;

	setupMesh();
}

void Mesh::setupMesh() {
	glGenVertexArrays(1, &VAO);
	glGenBuffers(1, &VBO);
	glGenBuffers(1, &EBO);

	glBindVertexArray(VAO);
	glBindBuffer(GL_ARRAY_BUFFER, VBO);

	glBufferData(GL_ARRAY_BUFFER, vertices.size() * sizeof(Vertex), &vertices[0], GL_STATIC_DRAW);

	glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, EBO);
	glBufferData(GL_ELEMENT_ARRAY_BUFFER, indices.size() * sizeof(unsigned int), &indices[0], GL_STATIC_DRAW);

	glEnableVertexAttribArray(0);
	glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, sizeof(Vertex), (void*)0);

	glEnableVertexAttribArray(1);
	glVertexAttribPointer(1, 3, GL_FLOAT, GL_FALSE, sizeof(Vertex), (void*)offsetof(Vertex, normal));

	glEnableVertexAttribArray(2);
	glVertexAttribPointer(2, 2, GL_FLOAT, GL_FALSE, sizeof(Vertex), (void*)offsetof(Vertex, TexCoords));

	glBindVertexArray(0);
}

void Mesh::Draw(Shader& shader) {
	unsigned int diffuseNr = 1;
	unsigned int specularNr = 1;
	for (unsigned int i = 0; i < textures.size(); i++) {
		glActiveTexture(GL_TEXTURE0 + i);
		std::string num;
		
		std::string name = textures[i].type;
		if (name == "texture_diffuse") {
			num = std::to_string(diffuseNr++);
		
		}
		else if (name == "texture_specular"){
			num = std::to_string(specularNr++);
			
		}
		shader.setInt(("material." + name + num).c_str(), i);
		glBindTexture(GL_TEXTURE_2D, textures[i].id);
	}
	
	if (specularNr == 1) {
		// No specular texture was used
		static Texture blackTexture("textures/solid_black.png", false, false);
		glActiveTexture(GL_TEXTURE0 + textures.size()); // Next unused unit
		shader.setInt("material.texture_specular1", textures.size());
		glBindTexture(GL_TEXTURE_2D, blackTexture.ID); // Bind the dummy black texture
	}

	glActiveTexture(GL_TEXTURE0);

	glBindVertexArray(VAO);
	glDrawElements(GL_TRIANGLES, indices.size(), GL_UNSIGNED_INT, 0);
	glBindVertexArray(0);
}
