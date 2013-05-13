web: bundle exec puma -q -d -e production -b 'unix:///home/ielt/shared/socket' -S /home/ielt/shared/puma.state --control 'unix:///home/ielt/shared/pumactl.sock'
worker: bundle exec sidekiq -c 1 -e production -L log/sidekiq.log -d
# sidekiq_web: bundle exec puma sidekiq.ru