# Use an official lightweight Python image.
FROM python:3.9-slim

# Set environment variables
ENV APP_HOME /app
ENV PORT 8080

# Install dependencies
RUN apt-get update -y && apt-get install -y gcc
RUN pip install --upgrade pip

# Copy local code to the container image
WORKDIR $APP_HOME
COPY . ./

RUN pip install \
  --no-cache-dir \
  --disable-pip-version-check \
  --root-user-action=ignore \
  -r requirements.txt

EXPOSE 8080

# Run the web service on container startup
CMD ["python3", "app.py"]
