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

  def most_goals_scored(input)
    a = all_games(input).max_by{|game|game.away_goals}
    b = all_games(input).max_by{|game|game.home_goals}
    result = 0
    [a, b].each do |game|
      if game.home_team_id == input && game.home_goals > game.away_goals
        result = game.home_goals
      elsif game.away_team_id == input && game.away_goals > game.home_goals
        result = game.away_goals
      end
    end
    result
  end

  def fewest_goals_scored(input)
    a = all_games(input).min_by{|game|game.away_goals}
    b = all_games(input).min_by{|game|game.home_goals}
    result = 0
    [a, b].each do |game|
      if game.home_team_id == input && game.home_goals < game.away_goals
        result = game.home_goals
      elsif game.away_team_id == input && game.away_goals < game.home_goals
        result = game.away_goals
      end
    end
    result
  end

  def favorite_opponent(input)
    hash = Hash.new
    all_opponents(input).each do |opponent|
      shared_games = []
      @games.each do |game|
        if game.away_team_id == input && game.home_team_id == opponent
          shared_games << game
        elsif game.away_team_id == opponent && game.home_team_id == input
          shared_games << game
        end
      end
      opp_win = []
      shared_games.each do |game|
        if game.away_team_id == opponent && game.outcome.include?("away")
          opp_win.push(game)
        elsif game.home_team_id == opponent && game.outcome.include?("home")
          opp_win.push(game)
        end
      end
      opp = @teams.find {|t| t.team_id == opponent}
      hash[opp.team_name] = (opp_win.count.to_f/shared_games.count).round(2)
    end
    q = hash.min_by{|team, percent| percent}
    q[0]
  end

  def rival(input)
    rivals = Hash.new
    all_opponents(input).each do |opponent|
      shared_games = []
      @games.each do |game|
        if game.away_team_id == input && game.home_team_id == opponent
          shared_games << game
        elsif game.away_team_id == opponent && game.home_team_id == input
          shared_games << game
        end
      end
      opp_win = []
      shared_games.each do |game|
        if game.away_team_id == opponent && game.outcome.include?("away")
          opp_win.push(game)
        elsif game.home_team_id == opponent && game.outcome.include?("home")
          opp_win.push(game)
        end
      end
      opp = @teams.find {|t| t.team_id == opponent}
      rivals[opp.team_name] = (opp_win.count.to_f/shared_games.count).round(2)
    end
    q = rivals.max_by{|team, percent| percent}
    q[0]
  end
#---
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

    def all_opponents(input)
      all_opponents = []
      all_games(input).each do |game|
        if game.away_team_id != input && game.home_team_id == input
          all_opponents << game.away_team_id
        elsif game.away_team_id == input && game.home_team_id != input
          all_opponents << game.home_team_id
        end
      end
      all_opponents.uniq
    end

end
