require 'helper'

	class ContinuableException < Exception
		include Continuable
	end

class TestContinuable < Test::Unit::TestCase

  def test_it_continues_after_continue
  	continued = false
  	rescued = false
  	begin
  		raise ContinuableException.new
  		continued = true
  	rescue Exception => ex
  		rescued = true
  		ex.continue
  	end
  	assert continued
  	assert rescued
  end

  def test_it_doesn_t_continue_without_calling_continue
  	continued = false
  	begin
  		raise ContinuableException.new
  		continued = true
  	rescue Exception => ex
  	end
  	assert !continued
  end

  def test_it_adds_continuation_to_the_exception
  	continued = false
  	rescued = false
  	begin
  		raise_continuable Exception.new
  		continued = true
  	rescue Exception => ex
  		rescued = true
  		ex.continue
  	end
  	assert continued
  	assert rescued
  end
end