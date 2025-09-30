# Magento Lando Plugin

This is the _NOT official_ [Lando](https://lando.dev) plugin for [Magento](https://developer.adobe.com/commerce/docs/). When installed it...

lando plugin-add @lukutpg/lando-magento

* Allows users to run a `magento` app
* Includes the Magento CLI, accessible via `lando magento`
* Allows configuration of PHP versions (e.g., PHP 5.3 to 8.4+) via Lando's PHP service
* Allows users to configure `Search Engine` (`elastisearch` or `opensearch`)
* Allows users to configure `Queue Engine` (`rabbitmq`)
* Allows users to configure `webroot`
* Allows users to configure web server to (`apache` or `nginx`)
* Allows users to configure database backend to (`mariadb`, `mysql`, or `postgres`)
* Allows users to configure `composer`
* Allows users to configure a caching backend (`redis` or `memcached`)
* Allows users to configure `xdebug`

Of course, once a user is running their Magento project with Lando they can take advantage of [all the other awesome development features](https://docs.lando.dev) Lando provides.

## Basic Usage

1. Add a `lando-magento` plugin by command:
```shell
lando setup --plugin @lukutpg/lando-magento
```
2. Add a `magento` recipe to your Landofile

```yaml
name: magento-app
recipe: magento
config:
  php: '8.2'
  via: apache:2.4
  database: mysql:5.7
```
