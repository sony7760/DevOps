## Assignment 1: Docker on Local
The purpose of this assignment is to enhance your understanding of Docker by working through a series of tasks that involve container creation, image management, networking, and orchestration
- **Docker Installation and Setup:**
  - Ensure Docker is installed on your machine. If not, install Docker from the [portal](./Installation.md)
- **Creating and Running Containers:**
  - Pull the official Nginx image from Docker Hub.
  - Run a container using the Nginx image and map port 80 of the container to port 8080 on your host machine.
  - Verify that Nginx is running by accessing http://localhost:8080 in your web browser.
- **Building Custom Docker Images:**
  - Create a simple HTML file named index.html with a "Hello, Docker!" message.
  - Write a Dockerfile that:
    - Uses the official Nginx image as the base image.
    - Copies the index.html file into the appropriate directory in the container.
  - Build a Docker image named custom-nginx from your Dockerfile.
  - Run a container using the custom-nginx image and verify that your HTML file is served correctly.
- **Working with Docker Volumes:**
  - Create a Docker volume named my_data.
  - Run a container using the custom-nginx image and mount the my_data volume to the /usr/share/nginx/html directory in the container.
  - Modify the content of the volume on the host machine and verify that the changes are reflected when accessing the container.
- **Docker Networking:**
  - Create a custom bridge network named my_bridge.
  - Run two containers (container1 and container2) using the official Nginx image and connect them to the my_bridge network.
  - Verify that the containers can communicate with each other using the container names (e.g., ping container1 from container2).
- **Docker Compose:**
  - Write a docker-compose.yml file to define a multi-container application that includes:
    - An Nginx container for serving static files.
    - A Redis container for caching.
  - Ensure the Nginx container depends on the Redis container.
  - Use Docker Compose to bring up the application and verify that both containers are running.

## Docker with DockerHub
- The purpose of this assignment is to deepen your understanding of Docker by creating custom images, working with Docker Hub, and managing image versions.
  - **Docker Hub Account:**
    - Create an account on [Docker Hub](https://hub.docker.com/) if you don't already have one.
    - Log in to Docker Hub from your terminal using the command
  - **Creating and Running Containers:**
    - Pull the official Python image from Docker Hub.
    - Run a container using the Python image and verify the Python installation by running a simple Python script that prints "Hello, Docker!".
  - **Building Custom Docker Images:**
    - Create a simple Python application. For example, a script named app.py that prints "Hello, Docker Hub!".
    - Write a Dockerfile(/opt/custom-python-app.Dockerfile) that:
      - Uses the official Python image as the base image.
      - Copies the app.py file into the container.
      - Specifies the command to run the Python script when the container starts.
      - Build a Docker image named custom-python-app from your custom Dockerfile path(/opt/custom-python-app.Dockerfile).
  - **Tagging Docker Images:**
    - Tag your custom-python-app image with the format dockerhub_username/custom-python-app:version1
  - **Pushing Docker Images to Docker Hub:**
    - Push the tagged image to Docker Hub.
    - Verify that your image is available on Docker Hub by visiting your repository page on Docker Hub.
  - **Pulling and Running Images from Docker Hub:**
    - On a different machine (or after removing the local image), pull the image from Docker Hub.
    - Run a container using the pulled image and verify it works as expected.
  - **Updating and Versioning:**
    - Make a modification to your app.py script, such as changing the print message.
    - Update your Dockerfile if necessary and rebuild the image.
    - Tag the new image with dockerhub_username/custom-python-app:version2.
    - Push the new version to Docker Hub.
    - Verify both versions are available on Docker Hub.

## Docker with GitLab
The purpose of this assignment is to gain hands-on experience with setting up a Docker executor in GitLab CI/CD, building Docker images as part of a CI/CD pipeline, and pushing these images to the GitLab Container Registry.
- **Setting Up GitLab Runner with Docker Executor:**
  - Create a new project in GitLab.
  - Install GitLab Runner on your local machine following the official GitLab Runner installation guide.
  - Register a GitLab Runner with Docker executor for your project.
- **Creating a Simple Python Application:**
  - Create a simple Python application with a script named app.py that prints "Hello, GitLab CI/CD!".
  - Write a Dockerfile that:
    - Uses the official Python image as the base image.
    - Copies the app.py file into the container.
    - Specifies the command to run the Python script when the container starts.
- **Setting Up GitLab CI/CD Pipeline:**
  - Create a .gitlab-ci.yml file in the root of your repository and use GitLab predefined variables in the job for Container registry
    - CI_REGISTRY: This is pre-defined and should be the URL of the GitLab Container Registry.
    - CI_REGISTRY_IMAGE: This is pre-defined and should be the path to your container image.
    - CI_REGISTRY_USER: Set this to your GitLab username.
    - CI_REGISTRY_PASSWORD: Set this to your GitLab personal access token with read_registry and write_registry scopes.
- **Verifying the Image in GitLab Container Registry:**
  - Verify that your Docker image is present and tagged with the commit SHA.

## GuideLines:
- Submit a well-organized document with clear headings and step numbers.
- Include all necessary screenshots and code snippets.
- Clearly explain the purpose and rationale behind each step.
- Ensure that your setup follows security best practices.
- Add troubleshooting steps,  If you encounter any issues during the setup.
- Use GitLab project to do the documentation
