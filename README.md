# Project Overview

The code is based on the code available from the  paper "Teacher-Student Curriculum Learning" (https://arxiv.org/abs/1707.00183).

This is a fork made to run in Google Colab

## Environment

Google Colab on Ubuntu 18.04
Python 3.6

## Limitations on Google Colab

- Docker is not available on Google Colab at this moment
- Minecraft Java requires an OpenGL context to run
- Only one cell active at a time

## Workarounds

### Docker

There is no workaround for docker on Google Colab at the moment. Will have to run natively.

### OpenGL context

We need to start a virtual display. Thankfully, there are a few methods to do this.
The python native approach does not work, because for one, it needs a display manager active, but having no display means we don't have a display manager.
Even with a display manager active, it would not work as it would only create a virtual display, but not attached to a valid OpenGL context (The GPU).

The easiest approach is to run a virtual display using xvfb (Or X, but xvfb is somewhat simpler). You can create a virtual display with the following command:
```
Xvfb :0 -screen 0 1920x1080x16
``` 
This means create a screen 0 with 16bit colour and 1920x1080 pixels and export it to display nr. :0.

### One active cell at a time

This is not a limitation of Google Colab, but of Python Notebook in general. It's not really a limitation, but more of a design choice.

## Full tutorial

### Optional - Mount Google Drive

```
from google.colab import drive
drive.mount('/content/gdrive')
```

You will need to click the link and paste the code in the box that appears in the output terminal

### Install dependencies

Here, we do not need to install cuda + libcudnn since google colab comes with them pre-configured. (For other versions of Malmo, you may need to change the CUDA+libcudnn version. Check your GPU, CUDA version and libcudnn version.)

```
!sudo apt-get install libboost-all-dev -y
!sudo apt-get install libxerces-c3.2 -y
!sudo apt-get install python3-pip -y
!pip3 install git+https://github.com/tambetm/minecraft-py.git
!pip3 install opencv-contrib-python   
!pip3 install gym
!pip3 install pygame
!pip3 install git+https://github.com/tambetm/gym-minecraft
!pip3 install tensorflow-gpu===1.15.3
!pip3 install keras===2.2.5
!pip3 install h5py
!sudo apt-get install libboost-all-dev libpython3.6 openjdk-8-jdk ffmpeg python-tk python-imaging-tk
!sudo update-ca-certificates -f
!git clone https://github.com/tambetm/minecraft-py.git
!cd minecraft-py && pip3 install -e .
!pip3 install future
!pip3 install pillow
```

Install malmo

```
!wget --no-check-certificate --content-disposition https://github.com/microsoft/malmo/releases/download/0.37.0/Malmo-0.37.0-Linux-Ubuntu-18.04-64bit_withBoost_Python3.6.zip
# --no-check-cerftificate was necessary for me to have wget not puke about https
!curl -LJO https://github.com/microsoft/malmo/releases/download/0.37.0/Malmo-0.37.0-Linux-Ubuntu-18.04-64bit_withBoost_Python3.6.zip
!unzip ./Malmo-0.37.0-Linux-Ubuntu-18.04-64bit_withBoost_Python3.6.zip -d ./Malmo-install
!sudo update-ca-certificates -f
!export MALMO_XSD_PATH=./Malmo-install/Malmo-0.37.0-Linux-Ubuntu-18.04-64bit_withBoost_Python3.6/Schemas
!source ~/.bashrc
```

Change to jdk8. Current version of Malmo does not work with JDK11 due to the version number being written differently.
eg.
OpenJDK 8.0 vs JDK version-11.0 so Malmo can not find a valid JDK.
```
!sudo apt install openjdk-8-jdk-headless openjdk-8-jdk
%env JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
!java -version
```

Remove any previous branch of this project & clone it (If it's already present it will crash)

```
!sudo rm -rf ./TSCL/
!git clone https://github.com/ChrisAB/TSCL.git
```




<p align="center">
<a href="http://www.youtube.com/watch?v=cada0d_aDIc" title="Minecraft bridge/gap 15x15 world"><img src="http://img.youtube.com/vi/cada0d_aDIc/0.jpg" alt="Minecraft bridge/gap 15x15 world"/></a>
</p>

Directories `addition` and `minecraft` contain code for the respective experiments. See `readme.txt` in each directory for instructions.
