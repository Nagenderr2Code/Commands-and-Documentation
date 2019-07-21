# This command will dowanload the specified image from the docker hub
FROM node:8.16.0-alpine

# This app listens on port 3000. Below command will expose the port.
EXPOSE 3000

#The RUN instruction will execute any commands in a new layer on top of the current image and commit the results. 
#The resulting committed image will be used for the next step in the Dockerfile.
RUN apk add --update tini

RUN mkdir -p /usr/src/app

# The WORKDIR instruction sets the working directory for any RUN, CMD, ENTRYPOINT, COPY and ADD instruction that follow it in the DOCKERFILE.
# If the WORKDIR doesnot exist, it will be created even if it's not used in any subsequent DOCKERFILE instruction.
WORKDIR /usr/src/app
COPY package.json package.json

RUN npm install && npm cache clean

COPY . .

# There can only be  one CMD instruction in a Dockerfile. If you list more than one CMD then only the last CMD will take effect.
# The main purpose of a CMD is to provide the defaults for an executing container.
CMD ["tini", "--", "node", "./bin/www"]