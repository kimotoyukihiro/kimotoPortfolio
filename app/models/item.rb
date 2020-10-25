class Item < ApplicationRecord
	attachment :image
	belongs_to :user
	has_many :item_comments, dependent: :destroy
	has_many :nices
	paginates_per 8

	validates :title, presence: true,length: {maximum: 30, minimum: 2}
	validates :genre, presence: true
	validates :review,presence: true

end
