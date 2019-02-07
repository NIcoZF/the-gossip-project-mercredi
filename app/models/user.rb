class User < ApplicationRecord
  #has_secure_password
  #attr_accessible :email, :password
  attr_accessor :password

  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :join_table_user_private_messages
  has_many :received_messages, foreign_key: 'sender_id', class_name: "PrivateMessage", through: :join_table_user_private_messages
  has_many :gossips
  has_many :comments
  has_many :likes
  belongs_to :city


  validates :password, presence: true, length: { minimum: 6 }
  validates :email,
    presence: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email address please" }
end
