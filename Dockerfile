# Use an official Docker image as a base
FROM hashicorp/terraform:latest

# Set working directory
WORKDIR /workspace

# Copy your Terraform scripts into the container
COPY . /workspace

# Install any other dependencies if necessary (e.g., AWS CLI, etc.)
# RUN apk add --no-cache aws-cli

# Define the entry point for the container
ENTRYPOINT ["terraform"]
