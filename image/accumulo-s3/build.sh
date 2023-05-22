tag=$1
repo=$2
aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin "$repo"
docker build --no-cache -t accumulo-s3:"$tag" .
docker tag accumulo-s3:"$tag"   "$repo"/accumulo-s3:"$tag"
docker push  "$repo"/accumulo-s3:"$tag"