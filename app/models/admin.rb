class Admin < Coordinator
  has_and_belongs_to_many :categories
end