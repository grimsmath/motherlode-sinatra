# This sinatra app provides a multi-tenant, RESTful
# backend for maintaining and retrieving hierarchically
# categorized data within a particular geofence. The
# app was designed specifically to accommodate a wide
# range of content types.
#
# Author:: SwampCo (mailto: m@mlw.ac)
# License:: GNU/GPL

require 'sinatra'
require 'mongo'
require 'json'
require 'bcrypt'

configure do
  # MongoClient's from_uri method requires ENV['MONGODB_URI'] to be set
  # You may set in RACK_ENV or using foreman during development
  mongo_client = Mongo::MongoClient.from_uri

  # TODO: Extract DB name and configuration from ENV
  mongo_db = mongo_client.db('sinatraslode', pool_size: 5, timeout: 2)

  set :mongo_client, mongo_client
  set :mongo_db, mongo_db
  set :nuggets_coll, mongo_db['nuggets']
  set :categories_coll, mongo_db['taxonomy']
  set :users_coll, mongo_db['users']
end

helpers do
  # Determine if user and password are valid, return user if valid, nil if not
  def current_user
    user = settings.users_coll.find_one('username' => params[:u])
    return user['_id'] if user && BCrypt::Password.new(user['password_token']) == params[:p]
  end

  # Determine product from hostname setting root of taxonomy
  def product_id
    # Currently hardcoded.  TODO: Add header inspection and product list
    BSON.ObjectId('5277e610e4b0c2820179e545')
  end

  # Get direct moderators of a category
  def direct_moderators (category_id)
    # TODO: Can dry out user_may_moderate? with multiple returns
    category = settings.categories_coll.find_one('_id' => category_id) || Hash.new
    category['moderators'] || []
  end

  # Recursively ascend category taxonomy returning true when user is authorized,
  # false if root is encountered without finding authorization.  Careful, this is
  # expensive.
  def user_may_moderate? (category_id)
    # TODO: Do I need academic return flag?
    category = settings.categories_coll.find_one('_id' => category_id) || Hash.new
    moderators = category['moderators'] || []
    return true if moderators.include? current_user
    user_may_moderate? category['parent'] unless category['parent'].nil?
  end

  # Determine if user is a product root moderator and may modify categories and users.
  def user_is_admin?
    direct_moderators(product_id).include? current_user
  end

  # Create a well formatted slug, downcased and spaces substituted with hyphen
  def create_slug (value)
    value.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '') unless value.nil?
  end
end

# BASIC CRUD-- Mostly for administrative use

# User management routes

# Index of all users
get '/u' do
  halt 401 unless user_is_admin?
  settings.users_coll.find(nil,{:fields => {"password_token" => 0}}).to_a.to_json
end

# Create new user
post '/u' do
  user_doc = {
      username: params[:username],
      password_token: BCrypt::Password.create(params[:password]),
      name: params[:name]
  }
  # TODO: Add error trapping for things like duplicate username, nil password, etc.
  settings.users_coll.insert(user_doc).to_json
end

# Retrieve user profile
get '/u/:id' do
  halt 401 unless user_is_admin? # TODO: OR Current User
  settings.users_coll.find_one({'username' => params[:id]},{:fields => {"password_token" => 0}}).to_json
end

# Update user profile
put '/u/:id' do
  halt 401 unless user_is_admin? # TODO: OR Current User
  user_doc = {
      username: params[:username],
      password_token: BCrypt::Password.create(params[:password]),
      name: params[:name]
  }
  settings.users_coll.update({'username' => params[:id]}, user_doc).to_json
end

# Delete user account
delete '/u/:id' do
  halt 401 unless user_is_admin? # TODO: OR Current User
  settings.users_coll.remove('_id'=> params[:id]).to_json
end

# Category management routes

# Index of all categories
get '/c' do
  halt 401 unless user_is_admin?
  settings.categories_coll.find.to_a.to_json
end

# Create new category
post '/c' do
  halt 401 unless user_is_admin?
  category_doc = {
      title: params[:title],
      slug: create_slug(params[:title]),
      parent: BSON::ObjectId(params[:parent])
  }
  # TODO: Add error trapping
  settings.categories_coll.insert(category_doc).to_json
end

# Retrieve a category
get '/c/:id' do
  halt 401 unless user_is_admin?
  settings.categories_coll.find_one('slug' => params[:id]).to_json
end

# Update category
put '/c/:id' do
  halt 401 unless user_is_admin?
  category_doc = {
      title: params[:title],
      slug: create_slug(params[:title]),
      parent: BSON::ObjectId(params[:parent])
  }
  # TODO: Add error trapping
  settings.categories_coll.update({'slug' => params[:id]}, category_doc).to_json
end

# Delete category
delete '/c/:id' do
  halt 401 unless user_is_admin? # TODO: OR Current User
  # TODO: Handle orphan nodes
  settings.categories_coll.remove('slug'=> params[:id]).to_json
end

# Category moderator assignment routes

# Get array of moderator ids
get '/c/:category/moderators' do
  halt 401 unless user_is_admin?
  direct_moderators(:category).to_json
end

# Add moderator
post '/c/:category/moderators' do
  halt 401 unless user_is_admin?
  settings.categories_coll.update({'slug' => params[:category]},
                                  {"$addToSet" => {"moderators" => BSON::ObjectId(params[:moderator])}},
                                  :upsert => true, :safe => true).to_json
end

# Remove moderator
delete '/c/:category/moderators/:id' do
  halt 401 unless user_is_admin?
  settings.categories_coll.update({'slug' => params[:category]},
                                  {"$pull" => {"moderators" => BSON::ObjectId(params[:id])}},
                                  :safe => true).to_json
end

# Nugget management routes

# Index of all nuggets
get '/n' do
  #halt 401 unless user_is_admin?
  settings.nuggets_coll.find.to_json
end

# Create new nugget
post '/n' do
  nugget_doc = {
      title: params[:title],
      category: BSON::ObjectId(params[:category]),
      content: params[:content],
      author: BSON::ObjectId(params[:user]),
      published: false
  }
  # TODO: Add error trapping
  settings.nuggets_coll.insert(nugget_doc)
end

# Retrieve nugget
get '/n/:id' do
  halt 401 unless user_is_admin?
  settings.nuggets_coll.find_one('_id' => params[:id]).to_json
end

# Update nugget
put '/n/:id' do
  halt 401 unless user_is_admin?
  nugget_doc = {
      title: params[:title],
      category: BSON::ObjectId(params[:category]),
      content: params[:content],
      author: BSON::ObjectId(params[:user]),
      published: false
  }
  # TODO: Add error trapping
  settings.nuggets_coll.update({'_id' => params[:id]}, nugget_doc).to_json
end

# Delete nugget
delete '/n/:id' do
  halt 401 unless user_is_admin?
  settings.nuggets_coll.remove('_id'=> params[:id]).to_json
end

# Content display views

get '/d' do
  settings.categories_coll.find_one('_id' => product_id).to_json
end

get '/d/:category_slug' do
  # TODO: Get nugget titles and geofence
  settings.categories_coll.find_one('slug' => params[:category_slug]).to_json

  category = settings.categories_coll.find_one('slug' => params[:category_slug])
  nuggets = settings.nuggets_coll.find('category' => category['_id'])

  body = category.to_json
  #body['nuggets'] = nuggets.to_a

  body
end

get '/d/:category_slug/:nugget_id' do

end


get '/' do
  erb :index
end