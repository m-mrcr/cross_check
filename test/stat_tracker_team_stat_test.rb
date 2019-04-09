require './test/test_helper'

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

  def test_it_can_show_team_info_for_a_singular_team
    expected = { "team_id" => "5",
                 "franchise_id" => "17",
                 "short_name" => "Pittsburgh",
                 "team_name" => "Penguins",
                 "abbreviation" => "PIT",
                 "link" => "/api/v1/teams/5"}
    assert_equal expected, @stat_tracker.team_info("5")
  end

  def test_it_can_show_best_season_for_a_single_team
    assert_equal "20162017", @stat_tracker.best_season("5")
  end

  def test_it_can_show_worst_season_for_a_single_team
    assert_equal "20142015", @stat_tracker.worst_season("5")
  end

  def test_it_can_show_average_win_percentage_for_a_single_team
    assert_equal 0.56, @stat_tracker.average_win_percentage("5")
  end

  def test_it_can_show_most_goals_scored_by_a_single_team_in_a_single_game
    assert_equal 8, @stat_tracker.most_goals_scored("5")
  end

  def test_it_can_show_fewest_goals_scored_by_a_single_team_in_a_single_game
    assert_equal 0, @stat_tracker.fewest_goals_scored("5")
  end

end
