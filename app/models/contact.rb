class Contact < ApplicationRecord
	validates :name, presence: true
	belongs_to :branch
	belongs_to :division
	belongs_to :company
end
