#!/bin/bash

# Prompt for WordPress and Astro project details

# Load environment variables from .env file
if [ -f .env ]; then
  export $(grep -v '^#' .env | xargs)
fi

# Start the Docker containers
docker-compose down -v
docker-compose up -d --build

wordpress_url="http://localhost:8000"

# Wait for WordPress to be availablefini
until curl -s "http://localhost:8000" > /dev/null; do
  >&2 echo "WordPress is unavailable - sleeping"
  sleep 5
done

>&2 echo "WordPress is up - checking database connection"

# Add some debug output to check environment variables
>&2 echo "Trying to connect to MySQL at host: db"
>&2 echo "MySQL User: $MYSQL_USER"
>&2 echo "MySQL Database: $MYSQL_DATABASE"

# Wait for MySQL to be healthy
until [ "$(docker inspect -f '{{if .State.Health}}{{.State.Health.Status}}{{else}}starting{{end}}' my-headless-project-db)" == "healthy" ]; do
  >&2 echo "Waiting for MySQL to be healthy..."
  sleep 5
done

>&2 echo "Database connection successful - executing command"

# Install WordPress
echo "Installing WordPress..."
docker exec my-headless-project-wordpress wp core install \
    --url="http://localhost:8000" \
    --title="$WP_TITLE" \
    --admin_user="$WP_USER" \
    --admin_password="$WP_PASSWORD" \
    --admin_email="$WP_EMAIL" \
    --allow-root


# Install the GraphQL plugin for WordPress
echo "Installing plugins for WordPress..."
docker exec my-headless-project-wordpress wp plugin install wp-graphql --activate --allow-root
docker exec my-headless-project-wordpress wp plugin install advanced-custom-fields --activate --allow-root
docker exec my-headless-project-wordpress wp plugin install wpgraphql-acf --activate --allow-root
docker exec my-headless-project-wordpress wp plugin install updraftplus --activate --allow-root
docker cp advanced-custom-fields-pro my-headless-project-wordpress:/var/www/html/wp-content/plugins/
docker exec my-headless-project-wordpress wp plugin advanced-custom-fields-pro --activate --allow-root
docker exec my-headless-project-wordpress wp plugin install jwt-authentication-for-wp-rest-api --activate --allow-root




# Delete all posts
echo "Deleting all posts..."
docker exec my-headless-project-wordpress wp post delete $(docker exec my-headless-project-wordpress wp post list --format=ids) --force --allow-root

# Remove all themes
echo "Removing all themes..."
docker exec my-headless-project-wordpress wp theme delete $(docker exec my-headless-project-wordpress wp theme list --status=inactive --field=name) --allow-root

# Set permalinks to use post names
echo "Setting permalinks to post names..."
docker exec my-headless-project-wordpress wp rewrite structure '/%postname%/' --allow-root



echo "Setup complete. WordPress is available at http://localhost:8000 and Astro is available at http://localhost:3000."
