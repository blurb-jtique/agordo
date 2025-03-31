## SSL issue when OpenSSL is tweaked on Ubuntu 20.04

Postgres version: 11.9
Rails version: 2
Ruby version: 1.9.3

below is the log when tried to run `bundle exec thin start`
```
/home/rpi/.rbenv/versions/1.9.3-p550/lib/ruby/gems/1.9.1/bundler/gems/rails-54349061beff/activerecord/lib/active_record/connection_adapters/postgresql_adapter.rb:944: [BUG] Segmentation fault
ruby 1.9.3p550 (2014-10-27 revision 48165) [x86_64-linux]

-- Control frame information -----------------------------------------------
c:0123 p:---- s:0494 b:0494 l:000493 d:000493 CFUNC  :initialize
c:0122 p:---- s:0492 b:0492 l:000491 d:000491 CFUNC  :new
c:0121 p:0020 s:0482 b:0482 l:000481 d:000481 METHOD /home/rpi/.rbenv/versions/1.9.3-p550/lib/ruby/gems/1.9.1/bundler/gems/rails-54349061beff/activerecord/lib/active_record/connect
c:0120 p:0036 s:0478 b:0478 l:000477 d:000477 METHOD /home/rpi/.rbenv/versions/1.9.3-p550/lib/ruby/gems/1.9.1/bundler/gems/rails-54349061beff/activerecord/lib/active_record/connect
c:0119 p:---- s:0471 b:0471 l:000470 d:000470 FINISH
```

database log : `sudo tail -f /var/log/postgresql/postgresql-11-main.log`
```
2025-02-11 22:20:15.902 UTC [7446] [unknown]@[unknown] LOG:  could not accept SSL connection: Success
```

### Solution
Step 1: Edit PostgreSQL Configuration
```
sudo nano /etc/postgresql/11/main/postgresql.conf
```

Step 2: Look for ssl = on
Find: `ssl = on` and change it to `ssl = off`

Step 3: Restart PostgreSQL
```
sudo systemctl restart postgresql
```

**optional workaround**
Modify the development section (or the appropriate environment) to disable SSL:
```
nano config/database.yml
```

```yaml
development:
  adapter: postgresql
  encoding: unicode
  database: blurb_dev
  username: postgres
  password:
  host: 127.0.0.1
  port: 5432
  sslmode: disable
```