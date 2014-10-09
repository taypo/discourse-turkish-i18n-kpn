discourse-turkish-i18n
======================

Turkish locale files for discourse

Idea based on https://github.com/lidel/discourse-locale-override 

This repo is used to load Turkish localization files while bootstrapping or rebuilding a discourse docker instance.

You need to modify your app.yml file to get it working. Find the section where after code hooks are listed:

```ruby
hooks:
  after_code:
    - exec:
        cd: $home/plugins
        cmd:
          - mkdir -p plugins
          - git clone https://github.com/discourse/docker_manager.git
```

and add the required lines, so the final version will be:

```ruby
hooks:
  after_code:
    - exec:
        cd: $home/plugins
        cmd:
          - mkdir -p plugins
          - git clone https://github.com/discourse/docker_manager.git
    - exec:
        cd: /tmp
        cmd:
          - git clone https://github.com/taypo/discourse-turkish-i18n-kpn.git
          - cp -rT discourse-turkish-i18n/ /var/www/discourse/
          - rm -rf discourse-turkish-i18n
```
