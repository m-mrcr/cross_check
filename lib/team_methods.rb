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

end
