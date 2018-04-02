FROM tensorflow/tensorflow:latest-gpu-py3

# Set the working directory to /workspace
WORKDIR /workspace

# Installing dependencies for linux installation of opencv
RUN apt-get update && apt-get install -y \ 
    pkg-config \
    libopencv-dev \ 
    libav-tools  \ 
    libjpeg-dev \ 
    libpng-dev \ 
    libtiff-dev \ 
    libjasper-dev

# Copy the current directory contents into the container at /app
COPY ./requirements/requirements-gpu.txt ./

# Install any needed packages specified in requirements.txt
RUN pip --no-cache-dir install -r requirements-gpu.txt

# Make port 8888 available to the world outside this container
EXPOSE 8888

# Run jupyter when container launches
CMD ["jupyter", "notebook", "--ip='*'", "--port=8888", "--no-browser", "--allow-root"]


