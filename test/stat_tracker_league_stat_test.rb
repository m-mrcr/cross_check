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

  def test_can_return_team_with_worse_offense
    assert_equal "Predators", @stat_tracker.worst_offense
  end

  def test_can_return_team_with_best_defense
    assert_equal "Sharks", @stat_tracker.best_defense
  end

  def test_can_return_team_with_worse_defense
    assert_equal "Capitals", @stat_tracker.worst_defense
  end

  def test_can_return_team_with_highest_scoring_vistor
    assert_equal "Sharks", @stat_tracker.highest_scoring_visitor
  end

  def test_can_return_team_with_highest_scoring_home_team
    assert_equal "Penguins", @stat_tracker.highest_scoring_home_team
  end

  def test_can_return_team_with_lowest_scoring_vistor
    assert_equal "Predators", @stat_tracker.lowest_scoring_visitor
  end

  def test_can_return_team_with_lowest_scoring_home_team
    assert_equal "Capitals", @stat_tracker.lowest_scoring_home_team
  end

  def test_can_return_team_with_winningest_team
    assert_equal "Sharks", @stat_tracker.winningest_team
  end

  def test_can_return_team_with_best_fans
    assert_equal "Predators", @stat_tracker.best_fans
  end

  def test_can_return_team_with_worst_fans
    assert_equal ["Capitals"], @stat_tracker.worst_fans
  end

end
