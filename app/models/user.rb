class User < ApplicationRecord
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :join_table_user_private_messages
  has_many :received_messages, foreign_key: 'sender_id', class_name: "PrivateMessage", through: :join_table_user_private_messages
  has_many :gossips
  has_many :comments
  has_many :likes
  belongs_to :city
end
