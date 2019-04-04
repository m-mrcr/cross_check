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
    @game_id = attributes[:game_id]
    @team_id = attributes[:team_id]
    @hoa = attributes[:hoa]
    @won = attributes[:won]
    @settled_in = attributes[:settled_in]
    @head_coach = attributes[:head_coach]
    @goals = attributes[:goals]
    @shots = attributes[:shots]
    @hits = attributes[:hits]
    @pim = attributes[:pim]
    @power_play_opportunities = attributes[:power_play_opportunities]
    @power_play_goals = attributes[:power_play_goals]
    @face_of_win_percentage = attributes[:face_of_win_percentage]
    @giveaways = attributes[:giveaways]
    @takeaways = attributes[:takeaways]

end
