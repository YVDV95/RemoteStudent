class ChargesController < ApplicationController
	def new
	end

	def create
		Stripe.api_key = "sk_test_TNMompphZdc5N0F5Qp8Zr0KU"

		# Token is created using Stripe.js or Checkout!
		# Get the payment token ID submitted by the form:
		token = params[:stripeToken]

		# Create a Customer:
		customer = Stripe::Customer.create(
		  :email => "paying.user@example.com",
		  :source => token,
		)

		# Charge the Customer instead of the card:
		charge = Stripe::Charge.create(
		  :amount => 1000,
		  :currency => "eur",
		  :customer => customer.id,
		)
	end
	end
