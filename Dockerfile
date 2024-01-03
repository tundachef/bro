# Use Ubuntu as the base image
FROM ubuntu:20.04

# Update and install necessary dependencies
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get install -y python3.5 python3.5-dev python3-pip git libsqlite3-dev

# Set the working directory to /app
WORKDIR /app

# Clone the repository
RUN git config --global core.compression 9
RUN git clone https://github.com/tundachef/theo.git .

# Install virtualenv
RUN pip install virtualenv

# Create and activate a virtual environment, then install requirements
RUN virtualenv venv && \
    /bin/bash -c "source venv/bin/activate && pip install -r requirements.txt"

# Adjust permissions for specific directories if necessary
# For example, if your SQLite database is stored in the "data" directory:
RUN chmod a+rw /app /app/*


# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
ENV NAME World

# Set the default command to run when the container starts
ENTRYPOINT ["/app/venv/bin/python", "./theo.py"]