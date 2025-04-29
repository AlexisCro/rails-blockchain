class BlocksController < ApplicationController
  require 'json'

  def index
    @blocks = Block.all

    render json: @blocks, status: :ok
  end

  def mine
    @block = Block.new(data: block_params)

    if @block.save
      render json: @block, status: :created
    else
      render json: @block.errors, status: 302
    end
  end

  private

  def block_params
    JSON.parse(params[:data].to_json)
  end
end
