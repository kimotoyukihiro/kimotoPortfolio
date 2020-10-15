class Item < ApplicationRecord
	attachment :image
	belongs_to :user
	has_many :item_comments, dependent: :destroy
	has_many :nices, dependent: :destroy
end
