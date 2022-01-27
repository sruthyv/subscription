require 'pry'

class Broadcaster
  def initialize
    @handlers = []
  end

  def subscribe(&block)
    @handlers << block
  end

  def unsubscribe(&block)
    @handlers.delete(block)
  end

  def broadcast(*args)
    puts "execution of block -- START --"
    @handlers.each do |handler|
      handler.call(*args)
    end
    puts "execution of block -- END --"
    'broadcasted'
  end
end
