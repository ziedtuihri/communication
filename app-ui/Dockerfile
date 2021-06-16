# This image will be based on the oficial nodejs docker image
FROM node:10

# Commands will run in this directory
WORKDIR /home/app

# Add all our code inside that directory that lives in the container
ADD . /home/app

# Install dependencies and generate production dist
RUN \
    npm install -g @angular/cli@latest && \
    npm install -g bower gulp && \
    npm install && \
    bower install --config.interactive=false --allow-root && \
    gulp dist

# Tell Docker we are going to use this port
EXPOSE 4200

# start app
CMD ["ng", "serve", "--host", "0.0.0.0"]