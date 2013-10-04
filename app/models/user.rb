class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  has_and_belongs_to_many :categories

  field :username, type: String
  field :password_digest, type: String
  field :name, type: String
  field :email, type: String
  field :bio, type: String

  has_secure_password
end
