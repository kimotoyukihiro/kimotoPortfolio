class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items, dependent: :destroy
  has_many :item_comments,dependent: :destroy
  has_many :nices

  validates :name, presence: true,length: {maximum: 20, minimum: 2}


 def already_niced?(item)
   self.nices.exists?(item_id: item.id)
 end
end
