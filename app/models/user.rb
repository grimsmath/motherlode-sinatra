class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  has_and_belongs_to_many :categories
  has_many :authored, class_name: 'User'
  has_many :published, class_name: 'User'

  field :username, type: String
  field :password_digest, type: String
  field :name, type: String
  field :email, type: String
  field :bio, type: String

  has_secure_password

  def to_s
    name
  end

  def is_admin?
    true
  end
end
