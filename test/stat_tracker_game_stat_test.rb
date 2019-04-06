require './test/test_helper'
require './lib/game_methods'

class StatTrackerGameStatTest < MiniTest::Test

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

  def test_it_exists
    assert_instance_of StatTracker, @stat_tracker
  end

  def test_it_can_calculate_highest_total_score
    assert_equal 15 , @stat_tracker.highest_total_score
  end

  def test_it_can_calculate_lowest_total_score
    assert_equal 2, @stat_tracker.lowest_total_score
  end

  def test_it_can_calculate_biggest_blowout
    assert_equal 6, @stat_tracker.biggest_blowout
  end

  def test_it_can_calculate_percentage_home_wins
    skip
    assert_equal nil, @stat_tracker.percentage_home_wins
  end

  def test_it_can_calculate_percentage_visitor_wins
    skip
    assert_equal nil, @stat_tracker.percentage_visitor_wins
  end

  def test_it_can_calculate_count_of_games_by_season
    skip
    assert_equal nil, @stat_tracker.count_of_games_by_season
  end

  def test_it_can_calculate_average_goals_per_game
    skip
    assert_equal nil, @stat_tracker.average_goals_per_game
  end

  def test_it_can_calculate_average_goals_per_season
    skip
    assert_equal nil, @stat_tracker.average_goals_by_season
  end

end
