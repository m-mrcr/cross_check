class Game

  attr_reader :game_id,
              :season,
              :type,
              :date_time,
              :away_team_id,
              :home_team_id,
              :away_goals,
              :home_goals,
              :outcome,
              :home_rink_side_start,
              :venue,
              :venue_link,
              :venue_time_zone_id,
              :venue_time_zone_offset,
              :venue_time_zone_tz

  def initialize(attributes)
    @game_id = attributes[:game_id]
    @season = attributes[:season]
    @type = attributes[:type]
    @date_time = attributes[:date_time]
    @away_team_id = attributes[:away_team_id]
    @home_team_id = attributes[:home_team_id]
    @away_goals = attributes[:away_goals].to_i
    @home_goals = attributes[:home_goals].to_i
    @outcome = attributes[:outcome]
    @home_rink_side_start = attributes[:home_rink_side_start]
    @venue = attributes[:venue]
    @venue_link = attributes[:venue_link]
    @venue_time_zone_id = attributes[:venue_time_zone_id]
    @venue_time_zone_offset = attributes[:venue_time_zone_offset]
    @venue_time_zone_tz = attributes[:venue_time_zone_tz]
  end

end
