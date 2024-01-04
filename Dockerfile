# Specifies the base image as Node.js on Alpine Linux, which is a lightweight Linux distribution.
FROM node:alpine

#Sets the working directory inside the container to "/home".
WORKDIR /home

# Copies all files from the current directory (the context) into the "/home" directory of the container.
COPY . .

#Runs the npm install command to install the dependencies of the Node.js application.
RUN npm i

# Exposes port 8000, indicating that the application inside the container will be accessible on this port.
EXPOSE 8000

#Specifies the default command to run when the container starts, launching the Node.js application using the "app.js" script.
CMD ["node", "app.js"]