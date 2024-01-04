# Docker Volumes test

Create an image with a VOLUME:

```markdown
# Specifies the base image as Node.js on Alpine Linux, which is a lightweight Linux distribution.

FROM node:alpine

# Sets the working directory inside the container to "/home".

WORKDIR /home

# Copies all files from the current directory (the context) into the "/home" directory of the container.

COPY . .

# Runs the npm install command to install the dependencies of the Node.js application.

RUN npm i

# Exposes port 8000, indicating that the application inside the container will be accessible on this port.

EXPOSE 8000

# This command creates a Docker volume named "images" at the specified path "/home/images" inside the container. Volumes are used to persist data outside of the container filesystem, and they can be shared among multiple containers.

VOLUME ["/home/images"]

# Specifies the default command to run when the container starts, launching the Node.js application using the "app.js" script.

CMD ["node", "app.js"]
```

### Terminal

Build the image:

```markdown
docker build -t propscode254/dockervolumes:latest .
```

# 3 WAYS to HANDLE your VOLUME:

### 1\_ A new volume is created automatically in Docker if not given a name or path.

```
docker run -d -p CONTAINER_NEW_PORT:DOCKER_FILE_PORT IMAGEID/NAME

```

For example

![](/readme_img/novcmd.png)

View the new volume in Docker Desktop:

![](/readme_img/nov.png)

Add an image to this port (7000) with Thunder client. Check Docker Desktop to see the new image inside the volume:

![](/readme_img/datainv.png)

### Create a container with a named volume and save it in Docker::

```
docker run -d -p CONTAINER_NEW_PORT:DOCKER_FILE_PORT -v NAMEOFVOLUME:DOCKERFILE_VOLUME_PATH IMAGEID/NAME
```

For Example:
![](/readme_img/name.png)

View the new volume with the given name on your desktop:

![](/readme_img/volumes.png)

Use Thunderclient to send an image on the specified port, and you'll get a new image in that volume

![](/readme_img/version2.png)

### Create a container with a path and save it on your server::

```markdown
docker run -d -p CONTAINER_NEW_PORT:DOCKER_FILE_PORT -v ABSOLUTEPATH:DOCKERFILE_VOLUME_PATH IMAGEID/NAME
```

For Example:

![](/readme_img/path.png)

A new image is added to the images folder (previously only one):

![](/readme_img/thunderpath.png)

No new volume appears in your Docker Desktop.

### IMPORTANT CMD IN TERMINAL:

Sehe how many volumes:

```
docker volume ls
```

Stop Container:

```
docker container stop id1 id2 id2
```

Remove more containers (id1-> id one Container):

```
docker container rm -f id1 id2 id2
```

Navigate inside with this command in your container and use ls and cd folder as you normally do. For example to find your images in your Volume home/images

```
docker exec -it containerId/Name sh
```

![](/readme_img/navi.png)

(Remember to me: I deleted all images & containers of this repo)
