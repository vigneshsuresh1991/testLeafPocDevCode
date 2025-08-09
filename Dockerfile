# Use an official Node.js image with Bullseye (newer Debian)
FROM node:16-bullseye

# Install Git and Supervisor
RUN apt-get update && apt-get install -y git supervisor && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Clone your GitHub repository directly into /app
RUN git clone https://github.com/vigneshsuresh1991/testLeafPocDevCode .

# Install dependencies for the root project
RUN npm install

# Install dependencies for the API
WORKDIR /app/api
RUN npm install

# Create Supervisor config for web and api services
RUN mkdir -p /etc/supervisor/conf.d
RUN echo "[supervisord]\n\
nodaemon=true\n\
\n\
[program:web]\n\
directory=/app\n\
command=npm run dev:web\n\
autostart=true\n\
autorestart=true\n\
stderr_logfile=/var/log/web.err.log\n\
stdout_logfile=/var/log/web.out.log\n\
\n\
[program:api]\n\
directory=/app/api\n\
command=npm run dev:api\n\
autostart=true\n\
autorestart=true\n\
stderr_logfile=/var/log/api.err.log\n\
stdout_logfile=/var/log/api.out.log\n" \
> /etc/supervisor/conf.d/supervisord.conf

# Expose ports
EXPOSE 80 3500

# Start Supervisor to run both services
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]