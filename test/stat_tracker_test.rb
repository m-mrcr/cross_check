require_relative 'test_helper'

class StatTrackerTest < MiniTest::Test

  def setup
    @input = {games: './data/game_sample.csv',
              teams: './data/team_sample.csv'}
    @stat_tracker = StatTracker.new
  end

  def test_it_exists
    assert_instance_of StatTracker, @stat_tracker
  end

  def test_it_initiates_with_no_games_teams_or_stats
    assert_equal [], @stat_tracker.games
    assert_equal [], @stat_tracker.teams
    assert_equal [], @stat_tracker.stats
  end

  def test_it_can_create_games_from_csv_file
    @stat_tracker.get_games(@input)
    assert_instance_of Game, @stat_tracker.games[0]
  end

  def test_it_can_create_teams_from_csv_file
    @stat_tracker.get_teams(@input)
    assert_instance_of Team, @stat_tracker.teams[0]
  end

end
