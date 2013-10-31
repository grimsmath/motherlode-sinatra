class Nugget
  include Mongoid::Document

  belongs_to :category

  belongs_to :author
  belongs_to :coordinator


  field :title, type: String
  field :content, type: String
  field :published, type: Boolean
  field :loc, type: Array

  index({ loc: '2dsphere' }, { min: -200, max: 200})
end
