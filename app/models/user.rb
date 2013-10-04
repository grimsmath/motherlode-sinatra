class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  field :username, type: String
  field :password_digest, type: String
  field :name, type: String
  field :email, type: String
  field :bio, type: String

  has_secure_password
end
