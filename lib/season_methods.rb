
module SeasonMethods

# PRIMARY METHODS
  def biggest_bust(input)
    season_team_win_percentage(input).max_by{|team, percentage| percentage}[0]
  end

  def biggest_surprise(input)
    season_team_win_percentage(input).min_by{|team, percentage| percentage}[0]
  end

  def winningest_coach(input)
    season_coach_win_percentage(input).max_by{|coach, percentage| percentage}[0]
  end

  def worst_coach(input)
    season_coach_win_percentage(input).min_by{|coach, percentage| percentage}[0]
  end

  def most_accurate_team(input)
    season_team_accuracy(input).max_by{|team, percentage| percentage}[0]
  end

  def least_accurate_team(input)
    season_team_accuracy(input).min_by{|team, percentage| percentage}[0]
  end

  def most_hits(input)
    season_hits_by_team(input).max_by{|team, hits| hits}[0]
  end

  def fewest_hits(input)
    season_hits_by_team(input).min_by{|team, hits| hits}[0]
  end

  def power_play_goal_percentage(input)
    power_play_goals = 0
    goals = 0
    for stat in season_stats(input)
      power_play_goals += stat.power_play_goals
      goals += stat.goals
    end
    (power_play_goals.to_f / goals).round(2)
  end

# HELPER METHODS
  def season_stats(input)
    stats = []
    for game in season_relevant_games(input)
      for stat in @stats
        if stat.game_id == game.game_id
          stats.push(stat)
        end
      end
    end
    stats
  end

  def season_relevant_games(input)
    relevant_games = []
    for game in @games
      relevant_games.push(game) if game.season == input
    end
    relevant_games
  end

  def season_team_win_percentage(input)
    final = Hash.new
    for team in @teams
      if seasonal_summary(team.team_id)[input]
      regular = seasonal_summary(team.team_id)[input][:regular_season][:win_percentage]
      post = seasonal_summary(team.team_id)[input][:postseason][:win_percentage]
      diff = (regular - post)
      final[team.team_name] = diff
      end
    end
    final
  end

  def get_coaches(stat_collection)
    coaches = []
    for stat in stat_collection
      coaches.push(stat.head_coach)
    end
    coaches
  end

  def get_coaches_games(collection, coach)
    collection.find_all{|item| item.head_coach == coach}
  end

  def season_coach_win_percentage(input)
    final = Hash.new(0)
    season_stats = season_stats(input)
    for coach in get_coaches(season_stats)
      coach_games = get_coaches_games(season_stats, coach)
      coach_wins = []
      for stat in coach_games
        if stat.head_coach == coach && stat.won == "TRUE"
          coach_wins.push(stat)
        end
      end
      season_win_percentage = percentage(coach_wins, coach_games)
      final[coach] = season_win_percentage
    end
    final
  end

  def season_team_accuracy(input)
    final = Hash.new(0)
    for team in @teams
      shots = 0
      goals = 0
      for stat in season_stats(input)
        if seasonal_summary(team.team_id)[input] &&
           stat.team_id == team.team_id
          shots += stat.shots
          goals += stat.goals
        end
      end
      final[team.team_name] = shots / (goals.nonzero? || 1)
    end
    final
  end

  def season_hits_by_team(input)
    final = Hash.new(0)
    for team in @teams
      total_hits = 0
      for stat in season_stats(input)
        if seasonal_summary(team.team_id)[input] &&
          stat.team_id == team.team_id
          total_hits += stat.hits
        end
      end
      final[team.team_name] = total_hits
    end
    final
  end

end
