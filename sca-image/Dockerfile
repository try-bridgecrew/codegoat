FROM ubuntu
RUN mkdir /app
RUN groupadd -r johnnycodev && useradd -r -s /bin/false -g johnnycodev johnnycodev
WORKDIR /app
COPY . /app
RUN chown -R johnnycodev:johnnycodev /app
USER johnnycodev
CMD node index.js
