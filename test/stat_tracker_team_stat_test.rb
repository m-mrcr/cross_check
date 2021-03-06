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

  def test_it_can_show_favorite_opponent_for_a_single_team
    assert_equal "Predators", @stat_tracker.favorite_opponent("5")
  end

  def test_it_can_show_the_rival_of_a_single_team
    assert_equal "Sharks", @stat_tracker.rival("5")
  end

  def test_it_can_show_biggest_team_blowout
    assert_equal 6, @stat_tracker.biggest_team_blowout("5")
  end

  def test_it_can_show_worst_loss
    assert_equal 4, @stat_tracker.worst_loss("5")
  end

  def test_it_can_show_head_to_head_record_for_a_single_team
    expected = {"Capitals"=>0.63,
                "Predators"=>0.75,
                "Sharks"=>0.25}
    assert_equal expected, @stat_tracker.head_to_head("5")
  end

  def test_it_can_show_seasonal_summary_for_a_single_team

    expected = {"20142015"=>{:postseason=>{:win_percentage=>0.0,
                                           :total_goals_scored=>0,
                                           :total_goals_against=>0,
                                           :average_goals_scored=>0.0,
                                           :average_goals_against=>0.0},
                                           :regular_season=>{:win_percentage=>0.33,
                                                             :total_goals_scored=>4,
                                                             :total_goals_against=>5,
                                                             :average_goals_scored=>1.33,
                                                             :average_goals_against=>1.67}},
                "20152016"=>{:postseason=>{:win_percentage=>0.33,
                                           :total_goals_scored=>7,
                                           :total_goals_against=>8,
                                           :average_goals_scored=>2.33,
                                           :average_goals_against=>2.67},
                                           :regular_season=>{:win_percentage=>1.0,
                                                             :total_goals_scored=>6,
                                                             :total_goals_against=>4,
                                                             :average_goals_scored=>3.0,
                                                             :average_goals_against=>2.0}},
                "20162017"=>{:postseason=>{:win_percentage=>0.67,
                                           :total_goals_scored=>10,
                                           :total_goals_against=>4,
                                           :average_goals_scored=>3.33,
                                           :average_goals_against=>1.33},
                                           :regular_season=>{:win_percentage=>0.67,
                                                             :total_goals_scored=>12,
                                                             :total_goals_against=>14,
                                                             :average_goals_scored=>4.0,
                                                             :average_goals_against=>4.67}},
                "20172018"=>{:postseason=>{:win_percentage=>0.0,
                                           :total_goals_scored=>0,
                                           :total_goals_against=>0,
                                           :average_goals_scored=>0.0,
                                           :average_goals_against=>0.0},
                                           :regular_season=>{:win_percentage=>0.5,
                                                             :total_goals_scored=>8,
                                                             :total_goals_against=>7,
                                                             :average_goals_scored=>4.0,
                                                             :average_goals_against=>3.5}}}

    assert_equal expected, @stat_tracker.seasonal_summary("5")
  end

end
