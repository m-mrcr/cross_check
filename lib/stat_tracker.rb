require 'csv'
require_relative 'game'
require_relative 'team'
require_relative 'stat'
require_relative 'game_methods'
require_relative 'team_methods'
require_relative 'league_methods'
require_relative 'season_methods'

class StatTracker
  include GameMethods,
          LeagueMethods,
          TeamMethods,
          SeasonMethods

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
    CSV.foreach(input[:games], {headers: true}).map do |row|
      game = Game.new(row)
      @games.push(game)
    end
  end

  def get_teams(input)
    CSV.foreach(input[:teams], {headers: true}).map do |row|
      team = Team.new(row)
      @teams.push(team)
    end
  end

  def get_stats(input)
    CSV.foreach(input[:game_teams], {headers: true}).map do |row|
      stat = Stat.new(row)
      @stats.push(stat)
    end
  end

end
