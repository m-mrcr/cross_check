require_relative 'test_helper'

class StatTrackerTest < MiniTest::Test

  def setup
    game_path = './data/game.csv'
    team_path = './data/team_info.csv'
    game_teams_path = './data/game_teams_stats.csv'

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

  def test_it_can_create_games_from_csv_file
    @stat_tracker.get_games(@locations)
    assert_instance_of Game, @stat_tracker.games[0]
  end

  def test_it_can_create_teams_from_csv_file
    @stat_tracker.get_teams(@locations)
    assert_instance_of Team, @stat_tracker.teams[0]
  end

  def test_it_can_create_stats_from_csv_file
    @stat_tracker.get_stats(@locations)
    assert_instance_of Stat, @stat_tracker.stats[0]
  end

end
