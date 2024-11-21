# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Install FFmpeg and other required dependencies
RUN apt-get update && \
    apt-get install -y ffmpeg libavformat-dev libavcodec-dev libavdevice-dev libavutil-dev && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
ENV PYTHONUNBUFFERED=1

# Run main.py when the container launches
CMD ["python", "./main.py"]
