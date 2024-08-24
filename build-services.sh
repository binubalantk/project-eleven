
# pre-build base image
docker build -t  pelv-rhel-go-base-image ./pelv-rhel-go-base-image # --no-cache

#  build the microservices
docker-compose up --build # --no-cache
# docker-compose build --no-cache