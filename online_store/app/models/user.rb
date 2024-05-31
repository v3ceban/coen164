class User < ApplicationRecord
  before_save :default_values
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products

  private

  def default_values
    self.admin ||= false
  end
end
