class Category
  include Mongoid::Document

  has_many :children, class_name: 'Category'
  belongs_to :parent, class_name: 'Category'

  has_and_belongs_to_many :users, inverse_of: nil # Prevents storing category refs in User model

  field :name, type: String

  def to_s
    name
  end
end
