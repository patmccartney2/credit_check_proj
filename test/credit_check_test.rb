require 'minitest/autorun'
require 'minitest/pride'
require './lib/credit_check'
require 'pry'

class CreditCheckTest < Minitest::Test

  def test_existence
    cc = CreditCheck.new
    assert_instance_of CreditCheck, cc
  end


 def test_it_can_create_doublecc
   cc = CreditCheck.new
   num = cc.valid?(1234599)
   assert_equal [9, 18, 5, 8, 3, 4, 1], num
 end


end
