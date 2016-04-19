require 'sinatra'
require 'sinatra/reloader'
require 'slim'
require './models.rb'
require 'colorize'

# Set Slim to outpul pretty HTML so it's a bit easier to debug
Slim::Engine.default_options[:pretty] = true

get '/styles.css' do
  scss :styles
end

not_found do
  slim :not_found
end

get '/' do
  slim :home
end

get '/recitations' do
  @recitations = Recitation.all
  @groups = Group.all
  slim :recitations
end

get '/recitations/:id' do
  @recitation = Recitation.get(params[:id])
  slim :recitation
end

get '/recitations/:id/claims' do
  @recitation = Recitation.get(params[:id])
  slim :claims
end

get '/recitations/:id/claims/new' do
  @recitation = Recitation.get(params[:id])
  slim :new_claim
end

get '/recitations/:id/claims/admin' do
  @recitation = Recitation.get(params[:id])
  slim :admin_claim
end

# I know how inherently ugly it is that there's logic here in the controller.
# I apologize to any reader, but it's quite late, and I've already far overdone this assignment.

post '/new/claim' do
  new_claim = Claim.create(params['claim'])
  
  # Each of these are a task part that was checked as complete.
  solved_tasks = params['taskpart'].keys
  
  solved_tasks.each do |tpid|
    Claimpart.create(claim_id: new_claim.id, taskpart_id: tpid)
  end
  
  recitation_id = params['claim']['recitation_id']
  
  redirect to "/recitations/#{recitation_id}/claims"
end

post '/admin/claims' do
  new_grades = params['grade']
  demod = params['demo'].keys
  
  demod.each do |did|
    Claim.get(did).update(demonstrated: true)
  end
  
  new_grades.each do |g| 
    claim = Claim.get(g[0])
    claim.update(grade: g[1]) if !g[1].empty?
  end
  
  redirect to '/'
end


get '/admin' do
  slim :admin
end