#docker build -t njs-server .
#docker run -p 8080:8080 njs-server
FROM node:14

# Set the working directory
WORKDIR /app

RUN npm install -g http-server && \
	npm install -g newman webpack babel figlet

RUN npm install -g express react vue angular typescript
	
# Copy the application code
COPY /pages/* .
COPY /BE/* .
COPY index.html .

COPY welcome.js .

# Expose the port the application listens on
EXPOSE 8080

RUN echo "http://localhost:8080/index.html"

CMD ["node", "welcome.js"]
