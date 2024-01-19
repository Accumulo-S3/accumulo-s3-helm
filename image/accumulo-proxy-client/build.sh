tag=$1
repo=$2
aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin "$repo"
docker build --no-cache -t accumulo-proxy-client:"$tag" .
docker tag accumulo-s3:"$tag"   "$repo"/accumulo-proxy-client:"$tag"
docker push  "$repo"/accumulo-proxy-client:"$tag"