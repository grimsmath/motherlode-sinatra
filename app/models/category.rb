class Category
  include Mongoid::Document

  has_many :children, class_name: 'Category'
  belongs_to :parent, class_name: 'Category'

  has_and_belongs_to_many :admins, class_name: 'User', inverse_of: nil # Prevents storing category refs in User model

  field :name, type: String

  def to_s
    name
  end

  def primary_admins
    # TODO: Make this readable
    admins.empty? && !parent.nil? ? parent.primary_admins : admins
  end

  def all_admins
    retarr = admins || []
    unless parent.nil?
      retarr << parent.all_admins
    end
    retarr
  end
end
