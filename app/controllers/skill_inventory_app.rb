require 'sqlite3'

class SkillInventoryApp < Sinatra::Base

  get '/' do
    erb :dashboard
  end

  get '/skills' do
    @skills = skill_manager.all
    erb :index
  end

  get '/skills/new' do
    erb :new
  end

  post '/skills' do
    skill_manager.create(params[:skill])
    redirect '/skills'
  end

  get '/skills/:id' do |id|
    @skill = skill_manager.find(id.to_i)
    erb :show
  end

  get '/skills/:id/edit' do |id|
    @skill = skill_manager.find(id.to_i)
    erb :edit
  end

  put '/skills/:id' do |id|
    skill_manager.update(id.to_i, params[:skill])
    redirect "/skills/#{id}"
  end

  delete '/skills/:id' do |id|
    skill_manager.destroy(id.to_i)
    redirect '/skills'
  end

  def skill_manager
    if ENV['RACK_ENV'] == 'test'
      database = SQLite3::Database.new('db/skill_inventory_test.db')
    else
      database = SQLite3::Database.new('db/skill_inventory_development.db')
    end
    database.results_as_hash = true
    @skill_manager ||= SkillInventory.new(database)
  end
end
