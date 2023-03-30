APP_CONFIG = YAML.load_file("#{Rails.root}/config/config.yml")
Rails.application.routes.default_url_options[:host] = 'localhost:3000'
