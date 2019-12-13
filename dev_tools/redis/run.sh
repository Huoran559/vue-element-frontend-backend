# docker pull redis
docker run -d \
-p 6379:6379 \
-v /Users/huoran/Documents/projects/dev_env/redis/redis.conf:/etc/redis/redis.conf \
--privileged=true \
--name redis \
redis \
redis-server /etc/redis/redis.conf
