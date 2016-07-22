class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :stuk_todo_tasks, dependent: :destroy
  has_many :stuk_books, dependent: :destroy
  has_many :stuk_starter_projects, dependent: :destroy
  has_many :stuk_starter_pledges, dependent: :destroy
  has_many :stuk_starter_rewards, through: :stuk_starter_pledges, dependent: :destroy
end
