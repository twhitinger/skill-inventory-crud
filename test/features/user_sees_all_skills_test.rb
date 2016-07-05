require_relative '../test_helper'

class UserSeesAllTasksTest < FeatureTest
  include TestHelpers

  def setup
    skill_manager.create({ :title =>"Cook", :description => "food"})
    skill_manager.create({ :title =>"Sleep", :description => "ok"})
  end

  def test_user_sees_index_of_tasks
    visit "/skills"
    # save_and_open_page
    within("#skill_list") do
      assert page.has_content?("Cook")
      assert page.has_content?("Sleep")
    end
  end
end
