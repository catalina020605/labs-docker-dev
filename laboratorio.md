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

# Reconstruir

@catalina020605 ➜ /workspaces/labs-docker-dev (main) $ docker build -t my-nginx:latest .
[+] Building 12.1s (6/6) FINISHED                                                                                            docker:default
 => [internal] load build definition from dockerfile                                                                                   0.0s
 => => transferring dockerfile: 150B                                                                                                   0.0s
 => [internal] load metadata for docker.io/library/ubuntu:latest                                                                       0.0s
 => [internal] load .dockerignore                                                                                                      0.0s
 => => transferring context: 2B                                                                                                        0.0s
 => CACHED [1/2] FROM docker.io/library/ubuntu:latest                                                                                  0.0s
 => [2/2] RUN apt-get update && apt-get install -y nginx                                                                              10.8s
 => exporting to image                                                                                                                 0.8s
 => => exporting layers                                                                                                                0.7s
 => => writing image sha256:3f7b9d60714ae5fa70ce1a962578edeacd1d322cfb6d936ca84f9960972520ad                                           0.0s
 => => naming to docker.io/library/my-nginx:latest                                                                                     0.0s


@catalina020605 ➜ /workspaces/labs-docker-dev (main) $ docker build -t my-nginx:latest .
[+] Building 0.4s (6/6) FINISHED                                                                                             docker:default
 => [internal] load build definition from dockerfile                                                                                   0.0s
 => => transferring dockerfile: 150B                                                                                                   0.0s
 => [internal] load metadata for docker.io/library/ubuntu:latest                                                                       0.0s
 => [internal] load .dockerignore                                                                                                      0.1s
 => => transferring context: 2B                                                                                                        0.0s
 => [1/2] FROM docker.io/library/ubuntu:latest                                                                                         0.0s
 => CACHED [2/2] RUN apt-get update && apt-get install -y nginx                                                                        0.0s
 => exporting to image                                                                                                                 0.0s
 => => exporting layers                                                                                                                0.0s
 => => writing image sha256:3f7b9d60714ae5fa70ce1a962578edeacd1d322cfb6d936ca84f9960972520ad                                           0.0s
 => => naming to docker.io/library/my-nginx:latest 

 # HTML

 @catalina020605 ➜ /workspaces/labs-docker-dev (main) $ docker build -t my-nginx:latest .
[+] Building 1.8s (8/8) FINISHED                                                                                             docker:default
 => [internal] load build definition from dockerfile                                                                                   0.0s
 => => transferring dockerfile: 192B                                                                                                   0.0s
 => [internal] load metadata for docker.io/library/ubuntu:latest                                                                       0.0s
 => [internal] load .dockerignore                                                                                                      0.1s
 => => transferring context: 2B                                                                                                        0.0s
 => [1/3] FROM docker.io/library/ubuntu:latest                                                                                         0.0s
 => [internal] load build context                                                                                                      0.0s
 => => transferring context: 38B                                                                                                       0.0s
 => CACHED [2/3] RUN apt-get update && apt-get install -y nginx                                                                        0.0s
 => [3/3] COPY index.html /usr/share/nginx/html/                                                                                       0.2s
 => exporting to image                                                                                                                 1.0s
 => => exporting layers                                                                                                                0.9s
 => => writing image sha256:9629af8b01c832577653d775cdec67cbe112f9380016e650afd422a46d593094                                           0.0s
 => => naming to docker.io/library/my-nginx:latest 

 # workdir

 @catalina020605 ➜ /workspaces/labs-docker-dev (main) $ docker build -t my-nginx:latest .
[+] Building 2.1s (10/10) FINISHED                                                                                           docker:default
 => [internal] load build definition from dockerfile                                                                                   0.0s
 => => transferring dockerfile: 225B                                                                                                   0.0s
 => [internal] load metadata for docker.io/library/ubuntu:latest                                                                       0.0s
 => [internal] load .dockerignore                                                                                                      0.0s
 => => transferring context: 2B                                                                                                        0.0s
 => [1/5] FROM docker.io/library/ubuntu:latest                                                                                         0.0s
 => [internal] load build context                                                                                                      0.1s
 => => transferring context: 65B                                                                                                       0.0s
 => CACHED [2/5] RUN apt-get update && apt-get install -y nginx                                                                        0.0s
 => CACHED [3/5] COPY index.html /usr/share/nginx/html/                                                                                0.0s
 => [4/5] WORKDIR /app                                                                                                                 0.2s
 => [5/5] COPY myfile.txt .                                                                                                            0.2s
 => exporting to image                                                                                                                 1.2s
 => => exporting layers                                                                                                                1.1s
 => => writing image sha256:c986dcc3ab1cddb7368f3d5281621b7ad1a067be20e4399c719c4d37c5f9b494                                           0.0s
 => => naming to docker.io/library/my-nginx:latest 

 # script pyton 

 @catalina020605 ➜ /workspaces/labs-docker-dev (main) $ docker build -t my-nginx:latest .
[+] Building 26.0s (9/9) FINISHED                                                                                            docker:default
 => [internal] load build definition from dockerfile                                                                                   0.1s
 => => transferring dockerfile: 110B                                                                                                   0.0s
 => [internal] load metadata for docker.io/library/python:3.9                                                                          0.6s
 => [auth] library/python:pull token for registry-1.docker.io                                                                          0.0s
 => [internal] load .dockerignore                                                                                                      0.1s
 => => transferring context: 2B                                                                                                        0.0s
 => [1/3] FROM docker.io/library/python:3.9@sha256:65438c2e26dbf9f5db4b5553e332747fa20722c1b7c7ccc6f8480396ff4186db                   22.2s
 => => resolve docker.io/library/python:3.9@sha256:65438c2e26dbf9f5db4b5553e332747fa20722c1b7c7ccc6f8480396ff4186db                    0.1s
 => => sha256:65438c2e26dbf9f5db4b5553e332747fa20722c1b7c7ccc6f8480396ff4186db 10.35kB / 10.35kB                                       0.0s
 => => sha256:83a59ab1a4811d0d1b135849e5071eff4d461a56def17589bd1b2f093aeeb5a1 7.31kB / 7.31kB                                         0.0s
 => => sha256:10d643a5fa823cd013a108b2076f4d2edf1b2a921f863b533e83ea5ed8d09bd4 64.14MB / 64.14MB                                       1.3s
 => => sha256:9972540d93856f9ca3eff2cf803ffb472bf1687cd1a91365cc803a539281900b 2.52kB / 2.52kB                                         0.0s
 => => sha256:ca4e5d6727252f0dbc207fbf283cb95e278bf562bda42d35ce6c919583a110a0 49.55MB / 49.55MB                                       1.6s
 => => sha256:30b93c12a9c9326732b35d9e3ebe57148abe33f8fa6e25ab76867410b0ccf876 24.05MB / 24.05MB                                       0.7s
 => => sha256:d6dc1019d7935fe82827434da11bf96cf14e24979f8155e73b794286f10b7f05 211.24MB / 211.24MB                                     5.1s
 => => sha256:564d1c451ea70670b349d1250f5c0577416f873f6ee7b5cb33dafeb21c2c40a4 15.82MB / 15.82MB                                       2.2s
 => => extracting sha256:ca4e5d6727252f0dbc207fbf283cb95e278bf562bda42d35ce6c919583a110a0                                              2.4s
 => => sha256:c7d45ab0573c09f3315112fe3e8d273f4b54dab9e8c3f315810afb743e794a28 6.16MB / 6.16MB                                         1.8s
 => => sha256:ddfb50ba1977e47749619886799b60da9f2a856fca3270ccb051d2f326489bd5 233B / 233B                                             2.0s
 => => sha256:91b87d81d4c8d2b201b71e0a5b07fe01ea4e6d1be30cdc8c30f96653b6663df3 2.70MB / 2.70MB                                         2.2s
 => => extracting sha256:30b93c12a9c9326732b35d9e3ebe57148abe33f8fa6e25ab76867410b0ccf876                                              0.6s
 => => extracting sha256:10d643a5fa823cd013a108b2076f4d2edf1b2a921f863b533e83ea5ed8d09bd4                                              2.6s
 => => extracting sha256:d6dc1019d7935fe82827434da11bf96cf14e24979f8155e73b794286f10b7f05                                              6.7s
 => => extracting sha256:c7d45ab0573c09f3315112fe3e8d273f4b54dab9e8c3f315810afb743e794a28                                              0.4s
 => => extracting sha256:564d1c451ea70670b349d1250f5c0577416f873f6ee7b5cb33dafeb21c2c40a4                                              0.6s
 => => extracting sha256:ddfb50ba1977e47749619886799b60da9f2a856fca3270ccb051d2f326489bd5                                              0.0s
 => => extracting sha256:91b87d81d4c8d2b201b71e0a5b07fe01ea4e6d1be30cdc8c30f96653b6663df3                                              0.2s
 => [internal] load build context                                                                                                      0.1s
 => => transferring context: 30B                                                                                                       0.0s
 => [2/3] WORKDIR /app                                                                                                                 0.2s
 => [3/3] COPY script.py .                                                                                                             0.2s
 => exporting to image                                                                                                                 2.2s
 => => exporting layers                                                                                                                2.1s
 => => writing image sha256:905ce4d22a41af82c7eac884c3f710579d794c39536ede7a0196141194d0234b                                           0.0s
 => => naming to docker.io/library/my-nginx:latest  