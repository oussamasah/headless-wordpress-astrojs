# Headless WordPress & Astro.js CMS Generator with Docker

This project allows you to generate dynamic websites using **WordPress** as a headless CMS and **Astro.js** as the static site generator, all within an automated Dockerized environment. It uses **GraphQL** to fetch content from WordPress, ensuring fast, SEO-friendly, and flexible websites. The system automates the configuration of the architecture, making it easy to set up and deploy.

## Features
- **Headless CMS**: Use **WordPress** for content management with **GraphQL** to fetch content for the front-end.
- **Astro.js Integration**: Seamlessly integrate WordPress content into static websites built with **Astro.js**.
- **Dockerized Environment**: All components (WordPress, MySQL, and the front-end) run in separate Docker containers, making setup and deployment easy.
- **Automated Architecture Setup**: Automated Docker configuration to spin up all services with a single command.
- **Real-Time Content Fetching**: Fetch WordPress content dynamically via GraphQL and render it with Astro.js.
- **SEO-Friendly**: Static HTML generation by Astro.js, optimizing the site for SEO performance.

## Tech Stack
- **Backend**: WordPress (Headless CMS)
- **Frontend**: Astro.js (Static Site Generator)
- **API**: GraphQL (for fetching content from WordPress)
- **Database**: MySQL (used by WordPress)
- **Containerization**: Docker (for containerized environment)

## Installation

### Prerequisites
Make sure you have Docker and Docker Compose installed:
- [Docker](https://www.docker.com/get-started)
- [Docker Compose](https://docs.docker.com/compose/)

### Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/oussamasah/headless-wordpress-astrojs.git
   cd headless-wordpress-astrojs
