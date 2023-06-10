#docker build -t njs-server  .
#docker run -p 8080:8080 njs-server
FROM node:14

# Set the working directory
WORKDIR /app


# Install http-server globally
RUN npm install -g http-server

# Copy the application code
COPY /pages/* .

# Expose the port the application listens on
EXPOSE 8080

RUN echo "http://localhost:8080/index.html"
RUN echo "http://localhost:8080/p.html"

CMD ["http-server"]
