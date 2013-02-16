class Object

	alias :__raise__ :raise
	def raise(*args)
		callcc do |continuation|
			begin
				super
			rescue Exception => ex
				ex.continuation = continuation if ex.respond_to?(:continue)
      	super ex
      end
    end
  end

  def raise_continuable(*args)
  	begin
  		__raise__ *args
  	rescue Exception => ex
  		(class << ex; self; end).send(:include,Continuable)
  		raise ex
  	end
  end
end