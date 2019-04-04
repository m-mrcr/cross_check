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
