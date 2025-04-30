class Block < ApplicationRecord
  before_validation :generate_hash,
                    :generate_timestamp,
                    :generate_previous_hash

  validate :validate_block, :validate_chain

  def generate_hash
    self.current_hash = BCrypt::Password.create(self.to_s)
  end

  def generate_timestamp
    self.timestamp = Time.now.to_i
  end

  def generate_previous_hash
    self.previous_hash = self.class.last&.current_hash
  end

  def validate_block
    if timestamp.nil?
      errors.add(:timestamp, "Timestamp can't be nil")
    end

    if data.empty?
      errors.add(:data, "Data can't be empty")
    end

    if hash.nil?
      errors.add(:hash, "Hash can't be nil")
    end
  end

  def validate_chain
    collection = self.class.all

    collection.each_with_index do |block, index|
      if index.positive?
        previous_block = collection[index - 1]

        if block.previous_hash.to_s != previous_block.current_hash.to_s
          errors.add(:chain, "Invalid chain at block #{index}")
        end
      end
    end
  end
end
