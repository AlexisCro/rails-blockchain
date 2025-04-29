# frozen_string_literal: true

# Create a module to encapsulate the BlockChain functionality
module BlockChain
  # Class Block
  class Block
    attr_accessor :previous_hash, :timestamp, :data, :hash

    def initialize(previous_hash: nil, **kwargs)
      @data = {}

      kwargs.each do |key, value|
        @data[key] = value
      end

      @hash          = BCrypt::Password.create(self.to_s)
      @previous_hash = previous_hash
      @timestamp     = Time.now.to_i
    end

    def to_s
      "Block {previous hash: #{@previous_hash}, timestamp: #{@timestamp}, data: #{@data}, hash: #{@hash}}"
    end
  end
end
