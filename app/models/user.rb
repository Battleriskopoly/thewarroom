class User < ActiveRecord::Base

  has_many :encampments
  accepts_nested_attributes_for :encampments

  has_many :forts, inverse_of: :user
  accepts_nested_attributes_for :forts

  has_many :trades
  accepts_nested_attributes_for :trades

  has_many :trade_proposals
  accepts_nested_attributes_for :trade_proposals

  has_many :user_game_attributes
  accepts_nested_attributes_for :user_game_attributes

  belongs_to :game

  has_many :legs
  accepts_nested_attributes_for :legs

  has_many :chesses
  accepts_nested_attributes_for :chesses

  has_many :pieces
  accepts_nested_attributes_for :pieces

  has_many :battles
  accepts_nested_attributes_for :battles

  before_save { self.email = email.downcase }
  before_create :create_remember_token
  validates :username, presence: true, length: { maximum: 50 }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end
end
