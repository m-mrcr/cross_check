class StatTracker
  attr_reader :games,
              :teams,
              :stats

  def initialize(input = nil)
    @games = []
    @teams = []
    @stats = []
  end

  def get_games(input)
    CSV.read(input[:games], {headers: true, header_converters: :symbol}).map do |row|
      game = Game.new(row)
      @games.push(game)
    end
  end

  def get_teams(input)
    CSV.read(input[:teams], {headers: true, header_converters: :symbol}).map do |row|
      team = Team.new(row)
      @teams.push(team)
    end
  end

end
