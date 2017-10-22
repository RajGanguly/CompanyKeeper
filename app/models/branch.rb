class Branch < ApplicationRecord
	validates :name, presence: true
	belongs_to :company
	has_many :contacts
end
