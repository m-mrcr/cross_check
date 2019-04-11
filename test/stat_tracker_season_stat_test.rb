require './test/test_helper'

class StatTrackerSeasonStatTest < MiniTest::Test

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

  def test_it_can_show_biggest_bust
    assert_equal "Penguins", @stat_tracker.biggest_bust("20152016")
  end

  def test_it_can_show_biggest_surprise
    assert_equal "Predators", @stat_tracker.biggest_surprise("20152016")
  end

  def test_it_can_show_winningest_coach
    assert_equal "Mike Johnston", @stat_tracker.winningest_coach("20152016")
  end

  def test_it_can_show_worst_coach
    assert_equal "Barry Trotz", @stat_tracker.worst_coach("20152016")
  end

  def test_it_can_show_most_accurate_team
    assert_equal "Penguins", @stat_tracker.most_accurate_team("20152016")
  end

  def test_it_can_show_least_accurate_team
    assert_equal "Capitals", @stat_tracker.least_accurate_team("20152016")
  end

  def test_it_can_show_most_hits
    assert_equal "Sharks", @stat_tracker.most_hits("20152016")
  end

  def test_it_can_show_fewest_hits
    assert_equal "Capitals", @stat_tracker.fewest_hits("20152016")
  end

  def test_it_can_show_power_play_goal_percentage
    assert_equal 0.16, @stat_tracker.power_play_goal_percentage("20152016")
  end

end
