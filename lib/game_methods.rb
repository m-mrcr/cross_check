module GameMethods

  def highest_total_score
    total = @games.max_by{|game| game.away_goals + game.home_goals}
    total.away_goals + total.home_goals
  end

  def lowest_total_score
    total = @games.min_by{|game| game.away_goals + game.home_goals}
    total.away_goals + total.home_goals
  end

  def biggest_blowout
    total = @games.max_by{|game| (game.away_goals - game.home_goals).abs}
    (total.away_goals - total.home_goals).abs
  end

  def percentage_home_wins
   games_won = @games.find_all{|game| game.home_goals > game.away_goals}
   (games_won.count.to_f / @games.count).round(2)
  end

  def percentage_visitor_wins
    games_won = @games.find_all{|game| game.home_goals < game.away_goals}
    (games_won.count.to_f / @games.count).round(2)
  end

  def count_of_games_by_season
    @games.inject(Hash.new(0)) do |hash, game|
      hash[game.season.to_s] += 1
      hash
    end
  end

  def average_goals_per_game
    (@games.sum{|game| game.away_goals} + @games.sum{|game| game.home_goals}).fdiv(@games.count).round(2)
  end

  def average_goals_by_season
    avgs = Hash.new
    seasons = @games.group_by {|game| game.season}
    seasons.each do |season|
      totals = []
      season[1].each do |game|
        totals << game.away_goals + game.home_goals
      end
      avgs[season[0].to_s] = (totals.sum / totals.count.to_f).round(2)
    end
    return avgs
  end
end
