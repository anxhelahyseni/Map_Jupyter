FROM ubuntu:latest

#######################
## Install Dependancies
RUN apt-get update && apt-get -y update
RUN apt-get install -y build-essential python3.6 python3-pip python3-dev

#######################
## Install Packages
#RUN pip3 -q install pip –upgrade
RUN pip3 install ipyleaflet

#######################
## Install modules
RUN git clone https://github.com/anxhelahyseni/Map_Jupyter.git

#######################
## Install Requirements
RUN pip3 install -r requirements.txt
RUN pip3 install jupyter


#######################
## Working Directory
RUN mkdir src
WORKDIR src/
COPY . .


CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]


#######################
## Pull Notebook from container
#docker pull anxhelah/map_jupyter


#######################
## Start Jupyter notebook
#docker run -p 8888:8888 anxhelah/map_jupyter