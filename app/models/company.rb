class Company < ApplicationRecord
	validates :name, presence: true
	has_many :branches
	has_many :divisions
end
