web: bundle exec puma -q -d -e production -b 'unix:///home/ielt/shared/socket' -S /home/ielt/shared/puma.state --control 'unix:///home/ielt/shared/pumactl.sock'
worker: bundle exec sidekiq -C config/sidekiq.yml -e production -d