class Team

  attr_reader :team_id,
              :franchise_id,
              :short_name,
              :team_name,
              :abbreviation,
              :link

  def initialize(attributes)
    @team_id = attributes["team_id"]
    @franchise_id = attributes["franchiseId"]
    @short_name = attributes["shortName"]
    @team_name = attributes["teamName"]
    @abbreviation = attributes["abbreviation"]
    @link = attributes["link"]
  end

end
