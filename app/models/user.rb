class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  def full_name
    if first_name.present?
      "#{first_name.capitalize} #{last_name.capitalize}"
    else
      last_name.capitalize
    end
  end


end
