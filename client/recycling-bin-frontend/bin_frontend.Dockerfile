FROM node:latest
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 8081
CMD ["npm", "run", "dev", "--", "--port", "8081"]

# docker build -f bin_frontend.Dockerfile -t limrenkee/binfrontend:1.0 ./
# docker run -it -p 8081:8081 limrenkee/binfrontend:1.0