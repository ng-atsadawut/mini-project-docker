
# Docker Sample Project

This is a simple project demonstrating how to use Docker for frontend and backend service and database. Each project has its own Dockerfile, and all services work together through `docker-compose`.

## Table of Contents
- [Project Structure](#project-structure)
- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
- [Dockerfiles](#dockerfiles)
- [Docker Compose](#docker-compose)
- [Usage](#usage)
- [Stopping the Containers](#stopping-the-containers)

## Project Structure

```
├── frontend/
│   ├── Dockerfile
│   ├── src/
│   └── ...
├── backend/
│   ├── Dockerfile
│   ├── src/
│   └── ...
├── docker-compose.yml
└── README.md
```

## Prerequisites

Ensure that you have the following installed:
- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Getting Started

To get started with this project:

1. **Clone the repository:**
    ```bash
    git clone https://github.com/ng-atsadawut/mini-project-docker.git
    ```

2. **Set up the frontend and backend projects:**
    - Each project contains a `Dockerfile` which defines the Docker image for that service.

## Dockerfiles

### Backend
The backend `Dockerfile` defines the setup for the backend service. It includes the necessary dependencies and environment setup to run the backend.

```Dockerfile
# Dockerfile for Backend

# Use the official Node.js image as a base image
FROM node:16

# Set the working directory
WORKDIR /app

# Install dependencies
COPY package.json package-lock.json ./
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose port 3000
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
```

### Frontend
The frontend `Dockerfile` sets up the environment and builds the frontend application.

```Dockerfile
# Dockerfile for Frontend

# Use an official Node.js runtime as the base image
FROM node:16

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the application code to the container
COPY . .

# Expose the port on which the frontend will run
EXPOSE 5173

# Start the application
CMD ["npm", "run", "dev", "--", "--host"]
```

## Docker Compose

The `docker-compose.yml` file is used to define and run multi-container Docker applications. This file allows both frontend and backend services to run simultaneously.

```yaml
version: '3'

services:
  postgres:
    image: postgres:latest
    environment:
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: password1234
      POSTGRES_DB: EcommerceDB
    ports:
      - "5432:5432"
    volumes:
      - postgres-data:/var/lib/postgresql/data
      - ./backend/schema.sql:/docker-entrypoint-initdb.d/schema.sql

  app:
    build:
      context: ./backend
    ports:
      - "3000:3000"
    depends_on:
      - postgres
    environment:
      PGUSER: postgres
      PGHOST: postgres
      PGDATABASE: EcommerceDB
      PGPASSWORD: password1234
      PGPORT: 5432
      SEARCH_PATH: public

  frontend:
    build:
      context: ./frontend
    ports:
      - "5173:5173"
    depends_on:
      - app

volumes:
  postgres-data:

```

## Usage

1. **Build and start the containers:**
    ```bash
    docker-compose up --build
    ```

    This command will build the Docker images for both the frontend and backend services and start them.

2. **Access the services:**
    - Frontend: `http://localhost:5173`
    - Backend: `http://localhost:3000`
    - Database: `http://localhost:5432`
      - User: `postgres`
      - Password: `password1234`

## Stopping the Containers

To stop the running containers:
```bash
docker-compose down
```

This command stops and removes the containers, networks, and volumes created by `docker-compose up`.

