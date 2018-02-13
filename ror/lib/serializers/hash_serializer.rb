module Serializers
  class HashSerializer
    def self.dump(hash)
      ActiveSupport::JSON.encode(hash)
    end

    def self.load(json)
      ActiveSupport::JSON.decode(json.present? ? json : '{}').with_indifferent_access rescue {}
    end
  end
end
