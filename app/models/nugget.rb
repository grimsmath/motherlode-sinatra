class Nugget
  include Mongoid::Document

  belongs_to :category

  belongs_to :author
  belongs_to :coordinator


  field :title, type: String
  field :content, type: String
  field :published, type: Boolean
end
