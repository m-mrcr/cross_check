module LeagueMethods

  def count_of_teams
    @teams.count
  end

  def best_offense
    best_team = average_goals_per_team.max_by{|x,y| y }
    teamnames(best_team[0])
  end

  def worst_offense
    best_team = average_goals_per_team.min_by{|x,y| y }
    teamnames(best_team[0])
  end

  def best_defense
    final = average_opponent_goals.min_by{|team, average| average}
    final[0]
  end

  def worst_defense
    final = average_opponent_goals.max_by{|team, average| average}
    final[0]
  end

  def highest_scoring_visitor
    final = average_away_goals_by_team.max_by{|team, average| average}
    final[0]
  end

  def highest_scoring_home_team
    final = average_home_goals_by_team.max_by{|team, average| average}
    final[0]
  end

  def lowest_scoring_visitor
    final = average_away_goals_by_team.min_by{|team, average| average}
    final[0]
  end

  def lowest_scoring_home_team
    final = average_home_goals_by_team.min_by{|team, average| average}
    final[0]
  end

  def winningest_team
    final = win_percentage_by_team.max_by{|team, percentage| percentage}
    final[0]
  end

  #---

  def teamnames(id)
    @teams.each do |team|
      if id == team.team_id
        return team.team_name
      end
    end
  end

  def group_by_team
    @stats.group_by {|game| game.team_id}
  end

  def average_goals_per_team
    average = Hash.new
    group_by_team.each do |team|
      totals = []
      team[1].each do |game|
        totals << game.goals
      end
      average[team[0].to_s] = (totals.sum / totals.count.to_f).round(2)
    end
    average
  end

  def average_opponent_goals
    average_opponent_goals = Hash.new
    @teams.each do |team|
      relevant_games = []
      @games.each do |game|
        if game.away_team_id == team.team_id || game.home_team_id == team.team_id
          relevant_games.push(game)
        end
      end
      opponent_goals = []
      relevant_games.each do |game|
        if game.away_team_id != team.team_id
          opponent_goals << game.away_goals
        elsif game.home_team_id != team.team_id
          opponent_goals << game.home_goals
        end
      end
      average = (opponent_goals.sum.to_f/opponent_goals.count).round(2)
      average_opponent_goals[team.team_name] = average
    end
    average_opponent_goals
  end

  def average_away_goals_by_team
    average_away_goals_by_team = Hash.new
    @teams.each do |team|
      relevant_games = []
      @games.each do |game|
        if game.away_team_id == team.team_id
          relevant_games.push(game)
        end
      end
      scores = []
      relevant_games.each do |game|
        scores.push(game.away_goals)
      end
      average = (scores.sum.to_f/scores.count).round(2)
      average_away_goals_by_team[team.team_name] = average
    end
    average_away_goals_by_team
  end

  def average_home_goals_by_team
    average_home_goals_by_team = Hash.new
    @teams.each do |team|
      relevant_games = []
      @games.each do |game|
        if game.home_team_id == team.team_id
          relevant_games.push(game)
        end
      end
      scores = []
      relevant_games.each do |game|
        scores.push(game.home_goals)
      end
      average = (scores.sum.to_f/scores.count).round(2)
      average_home_goals_by_team[team.team_name] = average
    end
    average_home_goals_by_team
  end

  def win_percentage_by_team
    win_percentage_by_team = Hash.new
    @teams.each do |team|
      relevant_stats = []
      @stats.each do |stat|
        if stat.team_id == team.team_id
          relevant_stats.push(stat)
        end
      end
      wins = []
      relevant_stats.each do |stat|
        if stat.won == "TRUE"
          wins.push(stat)
        end
      end
      final = (wins.count.to_f/relevant_stats.count).round(2)
      win_percentage_by_team[team.team_name] = final
    end
    win_percentage_by_team
  end

end
