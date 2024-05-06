# MySQL Docker Compose Build Environment

This repository contains Docker Compose files to set up a MySQL environment for development purposes. It includes scripts to check and install Docker and Docker Compose if not already installed.

## Installation

Before running the Docker Compose file, ensure that Docker and Docker Compose are installed on your system.

### Prerequisites

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)

### Installation Steps

1. **Clone the Repository:**

   ```bash
   git clone <repository-url>

2. **Navigate to the Project Directory:**

    ```bash
    cd <repository-folder>

3. **Check and Install Docker & Docker Compose:**

Execute the script check-docker&docker-compose-installation to ensure Docker and Docker Compose are installed on your system. If not, the script will install them for you.

    ```bash
    chmod +x check-docker&docker-compose-installation.sh 
    ./check-docker&docker-compose-installation.sh

4. **Starting the Environment**

    ```bash
    docker-compose -f m-mysql.yml up -d

5. **Stopping the Environment**

    ```bash
    docker-compose -f m-mysql.yml down


