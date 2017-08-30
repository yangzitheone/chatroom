class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_create :get_user_name

  has_many :room_users
  has_many :chatrooms, through: :room_users
  has_many :roommessages

  def get_user_name
      @emailarray = Array.new
      @emailarray = self.email.split("@")
      self.username = @emailarray[0]
  end
end

