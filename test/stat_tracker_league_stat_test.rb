require './test/test_helper'
require './lib/league_methods'

class StatTrackerLeagueStatTest < MiniTest::Test

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

  def test_can_count_total_number_of_teams
    assert_equal 4, @stat_tracker.count_of_teams
  end

  def test_can_return_team_with_best_offense
    assert_equal "Capitals", @stat_tracker.best_offense
  end

end
