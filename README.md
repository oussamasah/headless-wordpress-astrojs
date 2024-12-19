# Headless WordPress & Astro.js CMS Generator

This project enables the creation of headless CMS websites using **Astro.js** as the front-end and **WordPress** as the back-end, powered by **GraphQL**. With this system, you can easily set up a WordPress-powered website with Astro.js as the static site generator, allowing for flexible, fast, and SEO-friendly websites.

## Features
- **Headless CMS**: Uses **WordPress** for content management and **GraphQL** to fetch content for the front-end.
- **Astro.js Integration**: Seamlessly integrates WordPress content into static websites built with **Astro.js**.
- **Dynamic Site Generation**: Content from WordPress is fetched in real-time via GraphQL and rendered by Astro.js to generate static pages.
- **SEO-Optimized**: Astro.js generates static HTML, making websites faster and more SEO-friendly.
- **Modular Setup**: Easily customizable to work with any WordPress site and dynamically generate content-driven static websites.

## Tech Stack
- **Backend**: WordPress (Headless CMS)
- **Frontend**: Astro.js (Static Site Generator)
- **API**: GraphQL (for fetching content from WordPress)
- **Database**: MySQL (used by WordPress)
- **Deployment**: Docker (for containerized environment)

## Installation

### Prerequisites
Ensure you have the following tools installed:
- [Node.js](https://nodejs.org/) (version 16 or higher)
- [Composer](https://getcomposer.org/)
- [WordPress](https://wordpress.org/) with the **WPGraphQL** plugin installed

### Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/oussamasah/headless-wordpress-astrojs.git
   cd headless-wordpress-astrojs
