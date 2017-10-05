class JobsController < ApplicationController
	before_action :find_job, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@jobs = Job.all.order("created_at DESC")
	end

	def new
		@job = current_user.jobs.build
	end

	def show
	end

	def create
		@job = current_user.jobs.build(job_params)
		if @job.save
			redirect_to @job
		else
			render 'new'
		end
	end

	def edit
		if current_user != @job.user
			redirect_to root_path
		else
			render 'edit'
		end
	end

	def update
		if @job.update(job_params)
			redirect_to @job
		else
			render 'edit'
		end
	end

	def destroy
		@job.destroy
		redirect_to root_path
	end

	private

	def job_params
		params.require(:job).permit(:title, :description, :company, :url, :where, :money, :hours, :category_id, :typejob_id, :user_id)
	end

	def find_job
		@job = Job.find(params[:id])
	end
end
