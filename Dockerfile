# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set the working directory in the container
WORKDIR /code

# Copy the requirements file into the container
COPY requirements.txt /code/

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container
COPY . /code/

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Define the command to run the app using gunicorn
# django run as a python3.9
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "myproject.wsgi:application"]
