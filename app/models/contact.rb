class Contact < ApplicationRecord
	validates :name, presence: true
	belongs_to :branch, optional: true
	belongs_to :division, optional: true
end
