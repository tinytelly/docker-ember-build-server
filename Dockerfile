# Pull base image.
FROM node:6.9.2 
MAINTAINER tinytelly <dulwich22@gmail.com>

# Install time and ts to get timing information
RUN apt-get update && apt-get install -y time moreutils python-pip

# Install Bower & Grunt
RUN npm install -g bower grunt-cli && \
    echo '{ "allow_root": true }' > /root/.bowerrc
    
RUN \
	npm install -g ember-cli@2.7.0 &&\
	npm install -g phantomjs-prebuilt@2.1.13 &&\
	npm install -g yarn
	
RUN pip install boto3 # required for s3_upload.py

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["bash"]
