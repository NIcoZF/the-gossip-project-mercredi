class PrivateMessage < ApplicationRecord
  belongs_to :sender, class_name: "User"
  has_many :join_table_user_private_messages
  has_many :users, through: :join_table_user_private_messages
end
