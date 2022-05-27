# Use Ubuntu operating system
FROM ubuntu

# Create /app folder on docker container
WORKDIR /app

# Copy all the files from current folder to /app folder
COPY . /app

# Install Python and pip
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Australia/Sydney

# Depends on the version of the packages used in the notebook, sometimes
# we may beed to specify particular version of python i.e python 3.7
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
	python3-tk

# Install Python dependancies from requirements.txt file    
RUN pip3 install -r requirements.txt

# By default Voilà uses port 443
EXPOSE 443

# Run voila when the cotainer is launched
# Note, you need to change dashboard.ipynb to your notebook name
CMD voila es_monitoring.ipynb --Voila.ip=0.0.0.0 --port=443 --no-browser
