class Job < ApplicationRecord
	belongs_to :category
	belongs_to :typejob
	belongs_to :user
end
