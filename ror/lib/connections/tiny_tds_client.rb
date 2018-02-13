class Connections::TinyTdsClient
  class << self
    def config
      @config ||= Settingslogic.new("#{Rails.root}/config/database_mss.yml")[Rails.env]
    end

    def client
      @client ||= TinyTds::Client.new(
          username: config['username'],
          password: config['password'],
          host: config['host'],
          port: config['port'],
          database: config['database']
      )
    end
  end
end
