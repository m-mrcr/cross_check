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
# percentage_home_wins	Percentage of games that a home team has won (rounded to the nearest 100th)	Float
# percentage_visitor_wins	Percentage of games that a visitor has won (rounded to the nearest 100th)	Float
# count_of_games_by_season	A hash with season names (e.g. 20122013) as keys and counts of games as values	Hash
# average_goals_per_game	Average number of goals scored in a game across all seasons including both home and away goals (rounded to the nearest 100th)	Float
# average_goals_by_season	Average number of goals scored in a game organized in a hash with season names (e.g. 20122013) as keys and a float representing the average number of goals in a game for that season as a key (rounded to the nearest 100th)	Hash

end
