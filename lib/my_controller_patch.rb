module MyControllerPatch
	def self.included(base)
		base.class_eval do
			helper :sort
			helper :queries
		end
	end
end

