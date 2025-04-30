class BlockChainChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'blockchain_channel'
  end

  def receive(data)
    redirect_to blocks_path
  end
end
