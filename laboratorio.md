# output
@catalina020605 ➜ /workspaces/labs-docker-dev (main) $ docker pull nginx
Using default tag: latest
latest: Pulling from library/nginx
efc2b5ad9eec: Pull complete 
8fe9a55eb80f: Pull complete 
045037a63be8: Pull complete 
7111b42b4bfa: Pull complete 
3dfc528a4df9: Pull complete 
9e891cdb453b: Pull complete 
0f11e17345c5: Pull complete 
Digest: sha256:6af79ae5de407283dcea8b00d5c37ace95441fd58a8b1d2aa1ed93f5511bb18c
Status: Downloaded newer image for nginx:latest
docker.io/library/nginx:latest

# output
@catalina020605 ➜ /workspaces/labs-docker-dev (main) $ docker run -d -p 8080:80 nginx
71b93b133cd3fac0e7de831ecf06e44ecf586aff2f1e0c9029839021c73d11d1

# output
@catalina020605 ➜ /workspaces/labs-docker-dev (main) $ docker run -it ubuntu bash
Unable to find image 'ubuntu:latest' locally
latest: Pulling from library/ubuntu
9c704ecd0c69: Pull complete 
Digest: sha256:2e863c44b718727c860746568e1d54afd13b2fa71b160f5cd9058fc436217b30
Status: Downloaded newer image for ubuntu:latest
root@95e7f20efcfc:/# 

# output

@catalina020605 ➜ /workspaces/labs-docker-dev (main) $ docker ps -a
CONTAINER ID   IMAGE     COMMAND                  CREATED         STATUS                       PORTS                                   NAMES
95e7f20efcfc   ubuntu    "bash"                   4 minutes ago   Exited (127) 5 seconds ago                                           blissful_pascal
71b93b133cd3   nginx     "/docker-entrypoint.…"   7 minutes ago   Created                                                              boring_jones
1339ee44870f   nginx     "/docker-entrypoint.…"   7 minutes ago   Up 7 minutes                 0.0.0.0:8080->80/tcp, :::8080->80/tcp   elegant_shamir

@catalina020605 ➜ /workspaces/labs-docker-dev (main) $ docker rm 95e7f20efcfc
95e7f20efcfc

@catalina020605 ➜ /workspaces/labs-docker-dev (main) $ docker ps -a
CONTAINER ID   IMAGE     COMMAND                  CREATED         STATUS         PORTS                                   NAMES
71b93b133cd3   nginx     "/docker-entrypoint.…"   8 minutes ago   Created                                                boring_jones
1339ee44870f   nginx     "/docker-entrypoint.…"   9 minutes ago   Up 9 minutes   0.0.0.0:8080->80/tcp, :::8080->80/tcp   elegant_shamir

# output docker build

@catalina020605 ➜ /workspaces/labs-docker-dev (main) $ docker build -t ubuntu-updated:latest .
[+] Building 24.2s (9/9) FINISHED                                                                                            docker:default
 => [internal] load build definition from dockerfile                                                                                   0.0s
 => => transferring dockerfile: 571B                                                                                                   0.0s
 => [internal] load metadata for docker.io/library/ubuntu:latest                                                                       0.0s
 => [internal] load .dockerignore                                                                                                      0.1s
 => => transferring context: 2B                                                                                                        0.0s
 => [1/4] FROM docker.io/library/ubuntu:latest                                                                                         0.1s
 => [internal] load build context                                                                                                      0.3s
 => => transferring context: 44.23kB                                                                                                   0.0s
 => [2/4] RUN apt-get update && apt-get install -y     curl     wget     vim     && apt-get clean                                     21.7s
 => [3/4] WORKDIR /app                                                                                                                 0.2s
 => [4/4] COPY . /app                                                                                                                  0.2s
 => exporting to image                                                                                                                 1.4s
 => => exporting layers                                                                                                                1.3s
 => => writing image sha256:5e8234ed34cdfdf5b4e20905e956317ddb161e5931d58f996fb0d15f5aef9e87                                           0.0s
 => => naming to docker.io/library/ubuntu-updated:latest                                                                               0.0s


# CMD

CMD ["nginx", "-g", "daemon off;"]

# Construir

@catalina020605 ➜ /workspaces/labs-docker-dev (main) $ docker build -t my-nginx:latest .
[+] Building 26.4s (9/9) FINISHED                                                                                            docker:default
 => [internal] load build definition from dockerfile                                                                                   0.0s
 => => transferring dockerfile: 646B                                                                                                   0.0s
 => [internal] load metadata for docker.io/library/ubuntu:latest                                                                       0.0s
 => [internal] load .dockerignore                                                                                                      0.0s
 => => transferring context: 2B                                                                                                        0.0s
 => CACHED [1/4] FROM docker.io/library/ubuntu:latest                                                                                  0.0s
 => [internal] load build context                                                                                                      0.1s
 => => transferring context: 14.62kB                                                                                                   0.0s
 => [2/4] RUN apt-get update && apt-get install -y     curl     wget     vim     nginx     && apt-get clean                           24.0s
 => [3/4] WORKDIR /app                                                                                                                 0.2s
 => [4/4] COPY . /app                                                                                                                  0.2s
 => exporting to image                                                                                                                 1.5s
 => => exporting layers                                                                                                                1.4s
 => => writing image sha256:9ea3ac4315caf3880921d7077bbe6b1f4a22b3792e39a9e68524027dbe5aec08                                           0.0s
 => => naming to docker.io/library/my-nginx:latest     

 # Ejecutar

@catalina020605 ➜ /workspaces/labs-docker-dev (main) $ docker run -d -p 80:80 my-nginx:latest
04e1a8a2b24130249f64b3723ad0b3e459f5fc528ba4c4aa2ce9e677c59264b8