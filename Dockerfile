FROM node:4.4.3
MAINTAINER tinytelly <dulwich22@gmail.com>

# ember server on port 4200
# livereload server on port 49152
EXPOSE 4200 49152
WORKDIR /myapp

# run ember server on container start
ENTRYPOINT ["/usr/local/bin/ember"]
CMD ["server"]

# Note: npm is v2.14.7
RUN \
	npm install -g ember-cli@2.10.0 &&\
	npm install -g bower@1.7.2 &&\
	npm install -g phantomjs@2.1.1
  npm install -g yarn

# install watchman
# Note: See the README.md to find out how to increase the
# fs.inotify.max_user_watches value so that watchman will 
# work better with ember projects.
RUN \
	git clone https://github.com/facebook/watchman.git &&\
	cd watchman &&\
	git checkout v3.5.0 &&\
	./autogen.sh &&\
	./configure &&\
	make &&\
	make install
