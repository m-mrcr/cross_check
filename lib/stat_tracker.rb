class StatTracker
  attr_reader :games,
              :teams,
              :stats

  def initialize(input = nil)
    @game = []
    @team = []
    @stat = []
  end


  def get_games(input)
    CSV.read(input[:games], {headers: true, header_converters: :symbol}).map do |row|
      game = Game.new(row)
      @games.push(game)
    end
  end

end
