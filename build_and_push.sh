#!/bin/bash
docker build -t $aws_account_id.dkr.ecr.$region.amazonaws.com/$repository:$version .

aws ecr get-login-password --region $region | docker login --username AWS --password-stdin $aws_account_id.dkr.ecr.$region.amazonaws.com
docker push $aws_account_id.dkr.ecr.$region.amazonaws.com/$repository:$version