# Use an official Python runtime as a parent image
FROM python:3.12-slim

ENV DEBIAN_FRONTEND=noninteractive

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
RUN apt-get update && \
    apt-get install -y \
    git \
    && apt-get clean

RUN git clone --verbose https://github.com/Ditmanson/mlm.git .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port Gunicorn will run on
EXPOSE 8000

# Run Gunicorn
CMD ["gunicorn", "mountainlionmovies.wsgi:application", "--bind", "0.0.0.0:8000"]
