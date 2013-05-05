class Comment < ActiveRecord::Base
  attr_accessible :content, :name, :post_id, :created_at

  validates :content, presence: true
  validates :name, presence: true

  belongs_to :post
end
