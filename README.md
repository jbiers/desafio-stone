# hello-stone-app

you need permissions

- build image from dockerfile: docker image build ./hello-stone-app -t hello-stone-app

- create container from image: docker run -d -e PORT=8080 -p 8080:8080 --name hello-stone-app hello-stone-app

- after docker-compose: docker-compose up (optional tags)