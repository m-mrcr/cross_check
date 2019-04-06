require './test/test_helper'
require './lib/team_methods'

class StatTrackerTeamStatTest < MiniTest::Test

  def setup
    game_path = './data/game_sample.csv'
    team_path = './data/team_sample.csv'
    game_teams_path = './data/stat_sample.csv'

    @locations = {
      games: game_path,
      teams: team_path,
      game_teams: game_teams_path
    }
    @stat_tracker = StatTracker.from_csv(@locations)
  end

  def test_it_can_show_team_info
    expected = { "team_id" => "5",
                 "franchise_id" => "17",
                 "short_name" => "Pittsburgh",
                 "team_name" => "Penguins",
                 "abbreviation" => "PIT",
                 "link" => "/api/v1/teams/5"
               }
    assert_equal expected, @stat_tracker.team_info("5")
  end

end
