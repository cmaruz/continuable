module Continuable
	def self.included(base)
		base.send(:attr_accessor,:continuation)
	end

	def continue
		continuation.call
	end
end