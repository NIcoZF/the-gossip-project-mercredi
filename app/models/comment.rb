class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :gossip
  has_many :likes, as: :imageable
  has_many :subcomments, class_name: "Comment", foreign_key: "maincomment_id"
  belongs_to :maincomment, class_name: "Comment"
end
