# Build Image


docker build -t dotnet-ecs:latest .


### Login to ECR and push the Docker image:

aws ecr get-login <br/>
docker tag dotnet-ecs-demo "<< AWS ACCOUNT ID >>".dkr.ecr.us-east-1.amazonaws.com/dotnet-ecs-demo:latest <br/>
docker push <AWS ACCOUNT ID>.dkr.ecr.us-east-1.amazonaws.com/dotnet-ecs-demo
