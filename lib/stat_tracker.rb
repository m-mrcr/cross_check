require 'csv'
require_relative 'game'
require_relative 'team'
require_relative 'stat'

class StatTracker
  attr_reader :games,
              :teams,
              :stats

  def initialize(input = nil)
    @games = []
    get_games(input)
    @teams = []
    get_teams(input)
    @stats = []
    get_stats(input)
  end

  def self.from_csv(input)
    StatTracker.new(input)
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

  def get_stats(input)
    CSV.read(input[:game_teams], {headers: true, header_converters: :symbol}).map do |row|
      stat = Stat.new(row)
      @stats.push(stat)
    end
  end

end
