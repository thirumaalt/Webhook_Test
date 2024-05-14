# Use the official Nginx image as the base image
FROM nginx:latest

# Copy the HTML
COPY index.html /usr/share/nginx/html/

# Expose port 80 to allow external access
EXPOSE 80
