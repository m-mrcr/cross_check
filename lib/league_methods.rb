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

  #---

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



end
