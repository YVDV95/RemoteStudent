class JobsController < ApplicationController
	before_action :find_job, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@jobs = Job.all.order("created_at DESC")
		@typejobs = Typejob.all.order("created_at ASC")
	end

	def new
		@job = current_user.jobs.build
	end

	def show
	end

	def create

		@job = current_user.jobs.build(job_params)
		charge_error = nil

		if @job.valid?
			begin
				customer = Stripe::Customer.create(
				:email => params[:stripeEmail],
				:source  => params[:stripeToken]
				)

				charge = Stripe::Charge.create(
				:customer    => customer.id,
				:amount      => 4900,
				:description => 'RemoteStudent customer',
				:currency    => 'usd'
				)

				rescue Stripe::CardError => e
  					flash[:error] = e.message
  					redirect_to new_charge_path
				end
			    if charge_error
			      flash[:error] = charge_error
			      render 'new'
			    else
			    	@job.save
			    	redirect_to @job
			    end
			    flash[:error] = 'one or more errors in your order'
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
		params.require(:job).permit(:title, :description, :company, :url, :email, :where, :money, :hours, :category_id, :typejob_id, :user_id)
	end

	def find_job
		@job = Job.find(params[:id])
	end
end
