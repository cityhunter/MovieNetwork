class Review < ActiveRecord::Base
  validates :author, presence: true
  validates :content, presence: true
  belongs_to :movie

  has_many :comments, :dependent => :destroy
end