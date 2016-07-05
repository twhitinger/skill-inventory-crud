require_relative '../test_helper'
require 'pry'

class SkillInventoryTest < Minitest::Test
  include TestHelpers

  def setup
    skill_manager.create({ :title =>"Cook", :description => "food"})
    skill_manager.create({ :title =>"Sleep", :description => "ok"})
    skill_manager.create({ :title =>"DANCE", :description => "TWITCH"})
  end

  def current_skill_id
    skill_manager.all.first.id
  end

  def test_it_create_a_task
    assert_equal 3, skill_manager.all.length

    skill = skill_manager.find(current_skill_id)

    assert_equal "Cook", skill.title
    assert_equal "food", skill.description
  end

  def test_all_lists_tasks

    assert_equal 3, skill_manager.all.length
  end


  def test_find

    skill = skill_manager.find(current_skill_id)
    assert_equal "Cook", skill.title
  end

  def test_update
    skill = skill_manager.update(current_skill_id, {:title =>"WTF", :description => "IDIOT"})
    assert_equal "WTF", skill_manager.find(current_skill_id).title
  end

  def test_destroy
    skip
    skill_manager.destroy(current_skill_id)
    assert_equal 2, skill_manager.find(current_skill_id)
  end

end
