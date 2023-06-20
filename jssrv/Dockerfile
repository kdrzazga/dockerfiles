#docker build -t njs-server .
#docker run -p 8080:8080 -p 8090:8090 -p 8091:8091 -p 8092:8092 -p 8093:8093 -p 8094:8094 -p 8095:8095 njs-server
FROM node:14

WORKDIR /app
RUN mkdir thrill
RUN mkdir thrill/be
RUN mkdir thrill/fe
RUN mkdir webapp2
RUN mkdir webapp2/be
RUN mkdir webapp2/fe
RUN mkdir webapp3
RUN mkdir webapp3/be
RUN mkdir webapp3/fe
RUN mkdir webapp4
RUN mkdir webapp4/be
RUN mkdir webapp4/fe
RUN mkdir webapp5
RUN mkdir webapp5/be
RUN mkdir webapp5/fe
RUN mkdir webapp6
RUN mkdir webapp6/be
RUN mkdir webapp6/fe

RUN npm install -g http-server && \
	npm install -g newman webpack babel figlet

RUN npm install -g express react vue angular typescript
	
# Copy the application code
COPY /pages/* .
COPY /BE/* .
COPY index.html .

COPY welcome.js .

COPY thrill/ ./thrill
COPY webapp2/be/* ./webapp2/be/
COPY webapp3/be/* ./webapp3/be/
COPY webapp4/be/* ./webapp4/be/
COPY webapp5/be/* ./webapp5/be/
COPY webapp6/be/* ./webapp6/be/

COPY webapp2/fe/* ./webapp2/fe/
COPY webapp3/fe/* ./webapp3/fe/
COPY webapp4/fe/* ./webapp4/fe/
COPY webapp5/fe/* ./webapp5/fe/
COPY webapp6/fe/* ./webapp6/fe/

EXPOSE 8080 8090 8091 8092 8093 8094 8095

CMD ["node", "welcome.js"]
