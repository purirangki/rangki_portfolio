class User < ActiveRecord::Base
  def self.create_from_omniauth(params)
    attributes = {
      email: params['info']['email'],
      password: Devise.friendly_token
    }

    create(attributes)
  end

  has_many :authentications, class_name: 'UserAuthentication', dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :stuk_todo_tasks, dependent: :destroy
  has_many :stuk_books, dependent: :destroy
  has_many :stuk_starter_projects, dependent: :destroy
  has_many :stuk_starter_pledges, dependent: :destroy
  has_many :stuk_starter_rewards, through: :stuk_starter_pledges, dependent: :destroy
  has_many :places, dependent: :destroy
  has_many :places_reviews, dependent: :destroy
end
