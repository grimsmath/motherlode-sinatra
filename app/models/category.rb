class Category
  include Mongoid::Document

  has_many :children, class_name: 'Category'
  belongs_to :parent, class_name: 'Category'

<<<<<<< HEAD
  has_and_belongs_to_many :coordinators
  has_and_belongs_to_many :admins
=======
  has_and_belongs_to_many :admins, class_name: 'User', inverse_of: nil # Prevents storing category refs in User model
>>>>>>> 5ab53185d64ffd95eceb9216e8a45073e258ec85

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
