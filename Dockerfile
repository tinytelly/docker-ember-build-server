# Pull base image.
FROM node:6.9.2 
MAINTAINER tinytelly <dulwich22@gmail.com>

# Install Bower & Grunt
RUN npm install -g bower grunt-cli && \
    echo '{ "allow_root": true }' > /root/.bowerrc
    
RUN \
	npm install -g ember-cli@2.10.0 &&\
	npm install -g phantomjs@2.1.1 &&\
	npm install -g yarn    

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["bash"]
