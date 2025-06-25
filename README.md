![Screenshot from 2025-06-24 22-31-31](https://github.com/user-attachments/assets/afea4f45-8135-4188-9e7b-8d2c5a86406b)

![Screenshot from 2025-06-25 09-01-22](https://github.com/user-attachments/assets/1153d950-f09d-4e65-82e7-f21b74c60615)
![Screenshot from 2025-06-25 09-25-45](https://github.com/user-attachments/assets/1bff5723-3435-4b7c-b1a9-6449b101e6a9)
![Screenshot from 2025-06-25 09-26-31](https://github.com/user-attachments/assets/a18a709a-a279-45d0-8436-f5db0ac2fec6)

# Rails Application Setup with Docker

This document outlines the steps taken to set up a Ruby on Rails application with PostgreSQL, containerized using Docker. It includes the challenges faced during the setup process and the solutions implemented to resolve them, demonstrating problem-solving skills and attention to detail.

## Project Overview

The goal was to create a Rails application with a PostgreSQL database, scaffold a Post model, and containerize it using Docker and Docker Compose. The application was successfully deployed and made accessible at http://localhost:3000/posts.

## Setup Process

### 1. Initial Rails Application Setup

**Command**: `rails new myapp -d postgresql`  
**Purpose**: Created a new Rails application with PostgreSQL as the database.  

**Steps**:
- Installed Ruby and Rails: `sudo apt update && sudo apt install ruby-full && sudo gem install rails -v 7.1.3`
- Installed PostgreSQL: `sudo apt install postgresql postgresql-contrib`
- Started and enabled PostgreSQL: `sudo systemctl start postgresql && sudo systemctl enable postgresql`
- Created a PostgreSQL user: `sudo -u postgres createuser --interactive`
- Set a password for the PostgreSQL user: `ALTER USER vinaysunhare WITH PASSWORD 'vinay123';`
- Updated `config/database.yml` with the correct username and password.
- Installed dependencies: `bundle install`
- Installed `libyaml-dev`: `sudo apt install libyaml-dev`
- Created the database: `rails db:create`
- Generated scaffold: `rails generate scaffold Post title:string content:text`
- Ran migrations: `rails db:migrate`
- Started server: `rails server`

### 2. Dockerizing the Application

**Objective**: Containerize the Rails application and PostgreSQL using Docker and Docker Compose.

**Files Created**:
- **Dockerfile**: Ruby 3.2.2 with dependencies and app setup.
- **docker-compose.yml**: Web and DB service setup.
- **wait-for-db.sh**: Waits for DB to be ready.
- **entrypoint.sh**: Manages migrations and startup.

## 3. Challenges and Solutions

### Issue 1: Port Conflict with PostgreSQL
**Error**: Port 5432 already in use.  
**Solution**:
- `sudo lsof -i :5432`
- `sudo systemctl stop postgresql`
- `docker-compose down && docker-compose up -d`

### Issue 2: Missing `secret_key_base` in Production
**Solution**: Set `RAILS_ENV: development` in `docker-compose.yml`

### Issue 3: Database Connection Refused
**Solution**:
- Added `wait-for-db.sh`
- Used CMD in Dockerfile to delay start

### Issue 4: Pending Migrations Error
**Solution**:
- Ran `docker-compose run web bash`
- Executed `bundle exec rails db:migrate`

### Issue 5: No Route Matches /posts
**Solution**:
- Checked container: `docker exec -it myapp-web-1 bash`
- Verified routes and ran migrations

## 4. Final Configuration Files

- **.gitignore**: Standard exclusions.
- **Dockerfile**: Ruby, app setup, and execution.
- **docker-compose.yml**: Defines `web` and `db` services.
- **entrypoint.sh**: Runs migrations and starts server.
- **wait-for-db.sh**: Waits for DB to be ready.

## 5. Final Steps

- `git init`
- `git add . && git commit -m "Initial commit"`
- Verified app at: http://localhost:3000/posts

## Key Learnings

- **Dependency Management**
- **Docker Networking**
- **Database Synchronization**
- **Error Debugging**
- **Environment Configuration**

## How to Run the Application

```bash
git clone <repo-url>
cd myapp
docker-compose build
docker-compose run web rails db:migrate
docker-compose up -d
```

Access at: [http://localhost:3000/posts](http://localhost:3000/posts)

## Conclusion

Each issue was systematically diagnosed and resolved, resulting in a fully functional containerized Rails application. This demonstrates proficiency in Rails development, Docker containerization, and effective troubleshooting.
