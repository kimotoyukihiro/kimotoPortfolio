class Item < ApplicationRecord
	attachment :image
	belongs_to :user
	has_many :item_comments, dependent: :destroy
	has_many :nices
	paginates_per 8

	validates :title, presence: true,length: {maximum: 20, minimum: 2}
	validates :review,presence: true

end
