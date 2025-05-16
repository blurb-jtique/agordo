Sample of ruby installation in common conditions

```sh
==> Installing openssl-1.0.2u...
-> ./config "--prefix=$HOME/.rbenv/versions/1.9.3-p551/openssl" "--openssldir=$HOME/.rbenv/versions/1.9.3-p551/openssl/ssl" --libdir=lib zlib-dynamic no-ssl3 shared "-Wl,-rpath,$HOME/.rbenv/versions/1.9.3-p551/openssl/lib" no-ssl2 no-krb5
-> make -j 2
-> make install_sw
==> Installed openssl-1.0.2u to /home/rpi/.rbenv/versions/1.9.3-p551
==> Installing yaml-0.1.6...
-> ./configure "--prefix=$HOME/.rbenv/versions/1.9.3-p551"
-> make -j 2
-> make install
==> Installed yaml-0.1.6 to /home/rpi/.rbenv/versions/1.9.3-p551
==> Downloading ruby-1.9.3-p551.tar.bz2...
-> curl -q -fL -o ruby-1.9.3-p551.tar.bz2 https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p551.tar.bz2
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 9813k  100 9813k    0     0  3205k      0  0:00:03  0:00:03 --:--:-- 3205k
==> Installing ruby-1.9.3-p551...

WARNING: ruby-1.9.3-p551 is past its end of life and is now unsupported.
It no longer receives bug fixes or critical security updates.

-> ./configure "--prefix=$HOME/.rbenv/versions/1.9.3-p551" "--with-openssl-dir=$HOME/.rbenv/versions/1.9.3-p551/openssl"
```