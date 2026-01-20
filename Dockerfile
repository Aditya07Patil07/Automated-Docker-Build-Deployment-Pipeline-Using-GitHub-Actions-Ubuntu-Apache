
# 1. Use the official Ubuntu latest image
FROM ubuntu:latest

# 2. Avoid prompts from apt (like timezone selection)
ENV DEBIAN_FRONTEND=noninteractive

# 3. Update Ubuntu and install Apache
RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get clean

# 4. Copy our custom index.html to the Apache web folder
COPY index.html /var/www/html/index.html

# 5. Expose Port 80
EXPOSE 80

# 6. Start Apache in the foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]
