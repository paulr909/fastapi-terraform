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
docker build -t fastapi-terrav1 .

docker run --name fastapi-terrav1-container -p 80:80 -d -v $(pwd):/app fastapi-terrav1 
```
## Deployment Process

Run Terraform:
```shell
terraform init

terraform apply --auto-approve
```