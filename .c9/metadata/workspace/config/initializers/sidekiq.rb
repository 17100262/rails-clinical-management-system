{"filter":false,"title":"sidekiq.rb","tooltip":"/config/initializers/sidekiq.rb","undoManager":{"mark":0,"position":0,"stack":[[{"start":{"row":0,"column":0},"end":{"row":8,"column":0},"action":"insert","lines":["redis_url = ENV['REDISTOGO_URL'] || 'redis://localhost:6379'","Sidekiq.configure_server do |config|","  config.redis = { url: redis_url  }","end","","Sidekiq.configure_client do |config|","  config.redis = { url: redis_url}","end",""],"id":1}]]},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":0,"column":12},"end":{"row":0,"column":32},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1522922920555,"hash":"72e3b011d099feae0b1f69fb34b5c74ac527ab8b"}