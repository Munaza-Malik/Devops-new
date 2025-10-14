## Group Members:
Munaza Malik (44956) (Leader)
Areeba Sadaqat (47633) (Member)

## Technologies Used
- **Vite** for frontend build
- **Docker** for containerization
- **GitHub Actions** for CI/CD automation
- **AWS EC2** for deployment

# My Vite App - CI/CD Pipeline

## Description of CI/CD pipeline
- On push to `main` (or when a PR is merged) GitHub Actions builds a Docker image, pushes it to Docker Hub, then SSHes into the EC2 server to pull & run the new image.

## How to run
1. Install dependencies: `npm install`
2. Run dev: `npm run dev`
3. Build: `npm run build`
4. Build docker: `docker build -t munazamalik/my-vite-app:latest .`
5. Run: `docker run -d -p 80:80 munazamalik/my-vite-app:latest`

## How deployment works
- GitHub Actions builds and pushes `munazamalik/my-vite-app:latest`.
- The workflow SSHes into EC2 and runs `docker pull` and `docker run -d -p 80:80 ...`.

## Changelog
- 2025-10-10: Added CI/CD pipeline with GitHub Actions, Docker Hub push, and EC2 automatic deploy.  now fine?