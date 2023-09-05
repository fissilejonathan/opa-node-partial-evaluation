# Use the official MySQL image as the base image
FROM mysql:latest

# Set environment variables for MySQL
ENV MYSQL_ROOT_PASSWORD='root_password'
ENV MYSQL_DATABASE='learning_hub'
ENV MYSQL_USER='user_name'
ENV MYSQL_PASSWORD='user_password'

# Expose the MySQL port
EXPOSE 3306

# (Optional) Copy custom SQL scripts or configuration files
COPY schema.sql /docker-entrypoint-initdb.d/
# COPY custom.cnf /etc/mysql/conf.d/
