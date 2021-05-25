# start with a base centos7 image
FROM python:3.6.9

# Install cron
RUN apt-get update && apt-get -y install cron

# Install ssh / start ssh service / start daemon
RUN apt -y install openssh-server
RUN service ssh start
RUN /usr/sbin/sshd -D &

# For adding ssh in cmd line
# sshpass -v -p foobob ssh -o StrictHostKeyChecking=no foobob@guestapp "mkdir -p /tmp/bep"
RUN apt install sshpass

# Create non-root user
RUN useradd -m --no-log-init --system --uid 1000 foobob -s /bin/bash -g sudo -G root

# Change passwd
RUN echo 'foobob:foobob' | chpasswd

# Add crontab file in the cron directory
ADD crontab /etc/cron.d/hello-cron

# Copy other necessary job files to the current work directory
COPY currentTime.sh .

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/hello-cron && chmod 0777 /currentTime.sh

# Create the log file to be able to run tail
RUN touch /var/log/cron.log
RUN touch /timestamps.txt

# Run the command on container startup
CMD service ssh start && cron && tail -f /var/log/cron.log