# frozen_string_literal: true

module BlockChain
  # Class BlockChain, create the chain and link the blocks
  class BlockChain
    attr_reader :chain

    def initialize
      @chain = []
    end

    def add_block(**kwargs)
      previous_hash  = @chain.last&.hash
      @block         = Block.new(previous_hash: previous_hash, **kwargs)
      @previous_hash = @block.hash

      @chain << @block
    end

    def valid_chain?
      chain.each_with_index do |block, index|
        if index.positive?
          previous_block = chain[index - 1]
          return false if block.previous_hash.to_s != previous_block.hash
        end
      end

      true
    end

    def replace_chain(new_chain)
      if new_chain.length > chain.length && new_chain.valid_chain?
        @chain = new_chain
      else
        puts 'The new chain is not longer than the previous or is not valid.'
      end
    end
  end
end
