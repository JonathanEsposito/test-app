class Album < ActiveRecord::Base

  acts_as_tree

  has_many :photos

end
