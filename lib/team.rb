class Team

  attr_reader :team_id,
              :franchise_id,
              :short_name,
              :team_name,
              :abbreviation,
              :link

  def initialize(attributes)
    @team_id = attributes[:team_id]
    @franchise_id = attributes[:franchise_id]
    @short_name = attributes[:short_name]
    @team_name = attributes[:team_name]
    @abbreviation = attributes[:abbreviation]
    @link = attributes[:link]
  end

end
