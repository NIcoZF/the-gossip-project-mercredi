class Gossip < ApplicationRecord
  validates :title,
    presence: true,
    length: { minimum: 3 }
  validates :content, presence: true

  belongs_to :user
  has_many :tags
  #has_many :comments
  has_many :join_table_gossip_tags
  has_many :tags, through: :join_table_gossip_tags
  #has_many :likes, as: :imageable
end
