require 'models/skill_inventory'

class SkillInventoryApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)
  set :method_override, true

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
    database = YAML::Store.new('db/skill_manager')
    @skill_manager ||= SkillInventory.new(database)
  end
end
