# http://railscasts.com/episodes/217-multistep-forms
module ChessStoreHelpers
  module MultiStepForm
  	# validates_presence_of :billing_name, :if => lambda { |o| o.current_step == "billing" }

	def current_step
	  @current_step || steps.first
	end

	def steps
	  %w[shipping billing confirmation]
	end

	def next_step
	  self.current_step = steps[steps.index(current_step)+1]
	end

	def previous_step
	  self.current_step = steps[steps.index(current_step)-1]
	end

	def first_step?
	  current_step == steps.first
	end

	def last_step?
	  current_step == steps.last
	end

	def all_valid?
	  steps.all? do |step|
	    self.current_step = step
	    valid?
	  end
	end
  end
end