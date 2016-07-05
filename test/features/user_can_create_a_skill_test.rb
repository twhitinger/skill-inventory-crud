require_relative '../test_helper'

class UseCanCreateATaskTest < FeatureTest
  include TestHelpers

  def test_user_can_create_a_task
    # As a user
    # When I visit the dashboard
    visit "/"
    # and I click the lick "New task"
    click_link "New Skill"
    #Then I should be on hte new tasks page
    assert_equal "/skills/new", current_path
    # And I fill in the title field with "New Task"
    fill_in "skill[title]", with: "new task"
    # And I fill in the description field with "new description"
    fill_in "skill[description]", with: "new description"
    # And I click the submit button
    click_button "submit"
    assert_equal "/skill", current_path

    #Then i should see the list of task and all tasks added
    assert page.has_css?("#skill_list")
    assert page.has_content?("All Skills")
  end

end
