FROM node:14

# Set the working directory
WORKDIR /app

# Copy the package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the application
#RUN npm run build

# Expose the port
EXPOSE 8080

# Start the application
CMD ["npm", "ci" ]
CMD [ "npm", "start" ]

