require_relative '../test_helper'

class SkillTest < Minitest::Test

  def test_assigns_attributes_correctly
    skill = Skill.new({"id" => "11", "title" => "Party", "description" => "make it rain"})

    assert_equal "11", skill.id
    assert_equal "Party", skill.title
    assert_equal "make it rain", skill.description
  end

end
