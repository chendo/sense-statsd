build:
	docker build -t sense .

ship: build
	docker tag sense appa:50000/sense
	docker push appa:50000/sense
