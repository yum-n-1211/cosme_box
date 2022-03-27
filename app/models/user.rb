class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum sex: { woman: 0, man: 1 }
  enum personal_color: { spring: 0, summer: 1, autumn: 2, winter: 3 }
  enum skin_quality: { normal: 0, dry: 1, oily: 2, mixed: 3 }
end
