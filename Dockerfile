FROM gcr.io/google-samples/gb-frontend:v4

# overwrite the homepage with our version
COPY index.html /var/www/html/
