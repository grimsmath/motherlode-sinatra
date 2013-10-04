class Nugget
  include Mongoid::Document

  belongs_to :category
  belongs_to :author, class_name: 'User'

  field :title, type: String
  field :content, type: String
end
