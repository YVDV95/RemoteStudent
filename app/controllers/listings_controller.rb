class ListingsController < ApplicationController

	def index
		@jobs = Job.all.order("created_at DESC")
		@typejobs = Typejob.all.order("created_at DESC")
	end

	def myjobs
	end
end
