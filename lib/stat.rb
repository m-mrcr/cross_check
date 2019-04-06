class Stat

  attr_reader :game_id,
              :team_id,
              :hoa,
              :won,
              :settled_in,
              :head_coach,
              :goals,
              :shots,
              :hits,
              :pim,
              :power_play_opportunities,
              :power_play_goals,
              :face_of_win_percentage,
              :giveaways,
              :takeaways

  def initialize(attributes)
    @game_id = attributes["game_id"]
    @team_id = attributes["team_id"]
    @hoa = attributes["HoA"]
    @won = attributes["won"]
    @settled_in = attributes["settled_in"]
    @head_coach = attributes["head_coach"]
    @goals = attributes["goals"].to_i
    @shots = attributes["shots"].to_i
    @hits = attributes["hits"].to_i
    @pim = attributes["pim"].to_i
    @power_play_opportunities = attributes["powerPlayOpportunities"].to_i
    @power_play_goals = attributes["powerPlayGoals"].to_i
    @face_of_win_percentage = attributes["faceOffWinPercentage"].to_f
    @giveaways = attributes["giveaways"].to_i
    @takeaways = attributes["takeaways"].to_i
  end
end
