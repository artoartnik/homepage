class Post < ActiveRecord::Base
  attr_accessible :content, :title, :created_at

  validates :content, presence: true
  validates :title, presence: true

  has_many :comments, dependent: :destroy
end
