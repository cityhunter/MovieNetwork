class Review < ActiveRecord::Base
  belongs_to :movie

  has_many :comments, :dependent => :destroy
end
