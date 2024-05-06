#!/bin/bash

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check if Docker is installed
if ! command_exists docker; then
    echo "Docker not found. Installing..."
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    sudo usermod -aG docker $USER
    sudo systemctl enable docker
    sudo systemctl start docker
fi

# Check if Docker Compose is installed
if ! command_exists docker-compose; then
    echo "Docker Compose not found. Installing..."
    sudo apt install docker-compose -y
fi

echo "Docker and Docker Compose installation complete."
