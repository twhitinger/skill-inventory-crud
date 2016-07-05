ENV['RACK_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)

require 'minitest/autorun'
require 'minitest/pride'
require 'capybara/dsl'
require 'launchy'
require 'sqlite3'

module TestHelpers

  def teardown
    skill_manager.delete_all
    super
  end

  def skill_manager
    database = SQLite3::Database.new('db/skill_inventory_test.db')
    database.results_as_hash = true
    @database ||= SkillInventory.new(database)
  end

end

Capybara.app = SkillInventoryApp

class FeatureTest < Minitest::Test
  include Capybara::DSL
  include TestHelpers
end
