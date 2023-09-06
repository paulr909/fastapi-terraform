# Sample App using FastAPI, Docker, Terraform

Run the app:
```shell
uvicorn app.main:app --reload
```

Docker compose command:
```shell
docker-compose up --build -d
```

Docker commands:
```shell
docker build -t fastapi-terraform .

docker run --name fastapi-terraform-container -p 80:80 -d -v $(pwd):/app fastapi-terraform 
```
## Deployment Process

Run Terraform:
```shell
terraform init

terraform apply --auto-approve
```