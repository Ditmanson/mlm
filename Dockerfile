# Use an official Python runtime as a parent image
FROM python:3.12-slim

ENV DEBIAN_FRONTEND=noninteractive

# Set the working directory in the container
WORKDIR /app

# Install dependencies for Git (if necessary)
RUN apt-get update && \
    apt-get install -y git && \
    apt-get clean

# Clone the Git repository (if necessary) or copy files directly
# If you want to copy files from the local system instead of cloning from Git, you can use:
# COPY . /app/

RUN git clone --verbose https://github.com/Ditmanson/mlm.git .

# Copy the requirements.txt file into the container
COPY requirements.txt /app/

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Collect static files (if Django is configured to store them in the static directory)
RUN python3 manage.py collectstatic --noinput

# Expose the port that Gunicorn will run on
EXPOSE 8000

# Command to run Gunicorn to serve the Django app
CMD ["gunicorn", "mountainlionmovies.wsgi:application", "--bind", "0.0.0.0:8000"]
