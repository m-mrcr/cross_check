class StatTracker
  attr_reader :games,
              :teams,
              :stats

  def initialize(input = nil)
    @games = []
    @teams = []
    @stats = []
  end

end
