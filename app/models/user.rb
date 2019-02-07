class User < ApplicationRecord
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :join_table_user_private_messages
  has_many :received_messages, foreign_key: 'sender_id', class_name: "PrivateMessage", through: :join_table_user_private_messages
  has_many :gossips
  has_many :comments
  has_many :likes
  belongs_to :city
  # has_secure_password
  # validates :password, presence: true, length: { minimum: 6 }

    def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
    end

    # Forgets user by nullify remember_digest
    def forget
        update_attribute(:remember_digest, nil)
    end

    # Generate digest of given token
    def User.digest(token)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                      BCrypt::Engine.cost
        BCrypt::Password.create(token, cost: cost)
    end

    # Generate random token
    def User.new_token
        SecureRandom.urlsafe_base64
    end

    # Returns true if remember_token is valid
    def authenticated?(remember_token)
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end

    # Private methods
    private
        # Before filters
        # Make email lower-case
      def downcase_email
        email.downcase!
      end
end
