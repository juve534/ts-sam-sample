init:
	yarn

local:
	sam local invoke $(f) --event event.json --env-vars parameters/local/env.json

local-api:
	sam local start-api --env-vars parameters/local/env.json

build:
	./node_modules/.bin/tsc hello-world/app.ts

deploy:
	sam package --output-template-file packaged.yaml --s3-bucket ts-sam-sample --profile=$(p)
	sam deploy --template-file packaged.yaml --stack-name ts-sam-sample --capabilities CAPABILITY_IAM --no-fail-on-empty-changeset --profile=$(p)