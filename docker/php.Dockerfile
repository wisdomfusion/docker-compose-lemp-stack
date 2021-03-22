FROM php:7.4-fpm

WORKDIR /var/www/backend

RUN apt-get update && apt-get -y install \
    build-essential \
    libpng-dev \
    libmcrypt-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    zlib1g-dev \
    libxml2-dev \
    libonig-dev \
    libzip-dev \
    locales \
    zip \
    jpegoptim \
    optipng \
    pngquant \
    gifsicle \
    vim \
    unzip \
    git \
    curl

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install pdo_mysql mysqli mbstring zip exif pcntl
RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-install gd

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN groupadd -g 1000 www && useradd -u 1000 -ms /bin/bash -g www www && mkdir -p /var/www/backend

COPY --chown=www:www . /var/www/backend

USER www

EXPOSE 9000
CMD ["php-fpm"]
