# Problem I
# How do I have a dynamic instance variable dependent upon the element passed to it.


def file(input)
    input != "stat" ? input : input = "game_teams"
  end

  def get_objects(input)
    plurals = ["games", "teams", "stats"]
    singulars = ["game", "team", "stat"]
    plurals.each do |p|
      singulars.each do |s|
      CSV.read(input[(file(s)).to_sym], {headers: true, header_converters: :symbol}).map do |row|
        s = s.capitalize.new(row)
        @p.push(s)
      end
    end
  end
end

# def get_games(input)
#   CSV.read(input[:games], {headers: true, header_converters: :symbol}).map do |row|
#     game = Game.new(row)
#     @games.push(game)
#   end
# end

require 'csv'
game_path = './data/game_sample.csv'
team_path = './data/team_sample.csv'
game_teams_path = './data/stat_sample.csv'
locations = {
  games: game_path,
  teams: team_path,
  game_teams: game_teams_path
}
@games = CSV.read(locations[:games], {headers: true, header_converters: :symbol}.merge(Hash.new))
@teams = CSV.read(locations[:teams], {headers: true, header_converters: :symbol}.merge(Hash.new))
@stats = CSV.read(locations[:game_teams], {headers: true, header_converters: :symbol}.merge(Hash.new))

stat_tracker = StatTracker.new(locations)

def team_info(team_id)
  team = @teams.find {|team| team.team_id == team_id}
  info = Hash.new
  info[:team_id.to_s] = team.team_id
  info[:franchise_id.to_s] = team.franchise_id
  info[:short_name.to_s] = team.short_name
  info[:team_name.to_s] = team.team_name
  info[:abbreviation.to_s] = team.abbreviation
  info[:link.to_s] = team.link
  return info
end
