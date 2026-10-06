![Screenshot from 2025-06-24 22-31-31](https://github.com/user-attachments/assets/afea4f45-8135-4188-9e7b-8d2c5a86406b)

![Screenshot from 2025-06-25 09-01-22](https://github.com/user-attachments/assets/1153d950-f09d-4e65-82e7-f21b74c60615)
![Screenshot from 2025-06-25 09-25-45](https://github.com/user-attachments/assets/1bff5723-3435-4b7c-b1a9-6449b101e6a9)
![Screenshot from 2025-06-25 09-26-31](https://github.com/user-attachments/assets/a18a709a-a279-45d0-8436-f5db0ac2fec6)

# 🐳 Dockerized Rails App with PostgreSQL

A Ruby on Rails application containerized using **Docker and Docker Compose**, with **PostgreSQL** as the database.

This project demonstrates how to containerize a Rails application, configure a PostgreSQL database, manage application dependencies, handle database startup, and troubleshoot common Docker/Rails issues.

---

## 🚀 Project Overview

The project contains:

- Ruby on Rails application
- PostgreSQL database
- Docker containerization
- Docker Compose for multi-container setup
- Rails database migrations
- PostgreSQL connectivity
- Docker networking
- Database readiness handling
- Troubleshooting and debugging

### Architecture

```text
                ┌─────────────────────┐
                │     User / Browser  │
                └──────────┬──────────┘
                           │
                       Port 3000
                           │
                ┌──────────▼──────────┐
                │    Rails Container  │
                │      Ruby 3.2.2     │
                │     Rails 7.1.3     │
                └──────────┬──────────┘
                           │
                     Docker Network
                           │
                ┌──────────▼──────────┐
                │ PostgreSQL Container│
                │       Port 5432     │
                └─────────────────────┘
```

---

## 🛠️ Tech Stack

| Technology | Purpose |
|---|---|
| Ruby | Application runtime |
| Ruby on Rails | Web application framework |
| PostgreSQL | Relational database |
| Docker | Application containerization |
| Docker Compose | Multi-container orchestration |
| Linux | Development environment |
| Git & GitHub | Version control |

---

## 📁 Project Structure

```text
Dockerized-Rails-app-with-PostgreSQL/
│
├── app/                  # Rails application code
├── bin/                  # Rails executable scripts
├── config/               # Rails configuration
├── db/                   # Database migrations and seeds
├── k8s/                  # Kubernetes configuration
├── lib/                  # Custom libraries
├── public/               # Static files
├── test/                 # Test files
├── vendor/               # Dependencies
│
├── Dockerfile            # Docker image configuration
├── docker-compose.yml    # Rails + PostgreSQL services
├── wait-for-db.sh        # Waits for PostgreSQL readiness
├── Gemfile               # Ruby dependencies
├── Gemfile.lock          # Locked dependencies
├── .dockerignore         # Docker build exclusions
├── .gitignore            # Git exclusions
└── README.md             # Project documentation
```

---

## ⚙️ Prerequisites

Make sure the following are installed:

- Git
- Docker
- Docker Compose

Check the installation:

```bash
git --version
docker --version
docker compose version
```

---

## 📥 Clone the Repository

```bash
git clone https://github.com/vinaysunhare/Dockerized-Rails-app-with-PostgreSQL.git
```

Go inside the project:

```bash
cd Dockerized-Rails-app-with-PostgreSQL
```

---

## 🐳 Build Docker Images

Build the application image:

```bash
docker compose build
```

---

## 🗄️ Run Database Migration

Run Rails database migrations:

```bash
docker compose run web bundle exec rails db:migrate
```

If the database needs to be created:

```bash
docker compose run web bundle exec rails db:create
```

---

## ▶️ Start the Application

Start all services:

```bash
docker compose up -d
```

Check running containers:

```bash
docker compose ps
```

View application logs:

```bash
docker compose logs -f web
```

View PostgreSQL logs:

```bash
docker compose logs -f db
```

---

## 🌐 Access the Application

Open:

```text
http://localhost:3000/posts
```

The Rails application should be available through the `/posts` route.

---

## 🔧 Useful Docker Commands

### Stop containers

```bash
docker compose down
```

### Stop containers and remove volumes

```bash
docker compose down -v
```

### Restart services

```bash
docker compose restart
```

### View running containers

```bash
docker ps
```

### Open a shell inside the Rails container

```bash
docker compose exec web bash
```

### Run Rails console

```bash
docker compose exec web bundle exec rails console
```

### Run migrations

```bash
docker compose exec web bundle exec rails db:migrate
```

---

## 🐘 PostgreSQL

PostgreSQL runs as a separate Docker service.

The Rails application communicates with PostgreSQL through the Docker Compose service name rather than `localhost`.

```text
Rails Container
      │
      │ Docker Network
      ▼
PostgreSQL Container
```

This demonstrates container-to-container communication using Docker networking.

---

## 🐛 Troubleshooting

### 1. PostgreSQL Port Already in Use

Check which process is using port `5432`:

```bash
sudo lsof -i :5432
```

If a local PostgreSQL service is running:

```bash
sudo systemctl stop postgresql
```

Then restart Docker Compose:

```bash
docker compose down
docker compose up -d
```

---

### 2. Database Connection Refused

Make sure PostgreSQL is running:

```bash
docker compose ps
```

Check database logs:

```bash
docker compose logs db
```

The project uses `wait-for-db.sh` to wait for PostgreSQL before starting the Rails application.

---

### 3. Pending Migration Error

Run:

```bash
docker compose exec web bundle exec rails db:migrate
```

Then restart the application:

```bash
docker compose restart web
```

---

### 4. Container Shell for Debugging

Enter the Rails container:

```bash
docker compose exec web bash
```

Check Rails:

```bash
bundle exec rails --version
```

Check database configuration:

```bash
cat config/database.yml
```

---

## 🔍 What I Learned

Through this project, I practiced:

- Docker image creation
- Dockerfile configuration
- Docker Compose
- Multi-container applications
- Rails containerization
- PostgreSQL containerization
- Docker networking
- Container-to-container communication
- Database migrations
- Dependency management
- Application configuration
- Container debugging
- Troubleshooting startup issues
- Git and GitHub project management

---

## 🎯 DevOps Skills Demonstrated

```text
Docker
Docker Compose
Containerization
Linux
Git
GitHub
PostgreSQL
Ruby on Rails
Docker Networking
Database Management
Troubleshooting
Application Configuration
```

---

## 📌 Project Status

**Status:** ✅ Completed

The Rails application has been containerized with Docker and configured to communicate with PostgreSQL through Docker Compose.

---

## 👨‍💻 Author

**Vinay Sunhare**

DevOps / Cloud Learner | Docker | AWS | Kubernetes | Terraform | CI/CD

GitHub:  
https://github.com/vinaysunhare
