# Resources

cd ~

## @link https://getcomposer.org/download/
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '756890a4488ce9024fc62c56153228907f1545c228516cbf63f885e036d37e9a59d27d63f46af1d4d07ee0f76181c7d3') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"

## @link https://www.chriscollins.me/notes/install-composer-globally-on-mac-os/
mv composer.phar /usr/local/bin/composer.phar

# I keep the phar extension cause that's how my other machine is setup.
# Keeping it consistent means the alias `alias composer="php /usr/local/bin/composer.phar"`
# can stay in my universal profile and not have to be set in the `profile.local` setting on each machine.