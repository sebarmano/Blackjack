require 'player'
require 'dealer'
require 'pool'

class Game
  def initialize
    @pool = Pool.new
  end

  def pool
    @pool
  end
end
