module TeamMethods

  def team_info(input)
    team = @teams.find {|t| t.team_id == input}
    info = Hash.new
    info["team_id"] = team.team_id
    info["franchise_id"] = team.franchise_id
    info["short_name"] = team.short_name
    info["team_name"] = team.team_name
    info["abbreviation"] = team.abbreviation
    info["link"] = team.link
    return info
  end

  def best_season(input)
    final = percent_of_wins_by_season(input).max_by{|season, percent| percent}
    final[0]
  end

  def worst_season(input)
    final = percent_of_wins_by_season(input).min_by{|season, percent| percent}
    final[0]
  end

  def average_win_percentage(input)
    (games_won(input).count.to_f / all_games(input).count).round(2)
  end

  def percent_of_wins_by_season(input)
    percent_of_wins_by_season = Hash.new
    count_of_wins_by_season(input).map{|season, game|
      percent_of_wins_by_season[season] =
      (game.count.to_f/count_of_games_by_season[season]).round(2)}
    percent_of_wins_by_season
  end

  def count_of_wins_by_season(input)
    games_won(input).group_by{|game| game.season}
  end

  def games_by_season(input)
    all_games(input).group_by{|game| game.season}
  end

  def count_of_games_by_season(input)
    count_by_season = Hash.new
    games_by_season(input).map do |season, games|
      count_by_season[season] = games.count
    end
  end

  def games_won(input)
    games_won = []
    all_games(input).each do |game|
      if game.away_team_id == input && game.outcome.include?("away")
        games_won.push(game)
      elsif game.home_team_id == input && game.outcome.include?("home")
        games_won.push(game)
      end
    end
    games_won
  end

  def all_games(input)
    @games.select do |game|
      game.away_team_id == input || game.home_team_id == input
    end

end
