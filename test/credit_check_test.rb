require 'minitest/autorun'
require 'minitest/pride'
require './lib/credit_check'
require 'pry'

class CreditCheckTest < Minitest::Test

  def test_existence
    credit_check = CreditCheck.new
    assert_instance_of CreditCheck, credit_check
  end


 def test_it_can_save_and_split_card
   credit_check = CreditCheck.new
   result = credit_check.take_card_and_split(12345)
   assert_equal [5, 4, 3, 2, 1], result
 end

 def test_it_can_double_every_other_number
   credit_check = CreditCheck.new
   credit_check.take_card_and_split(12345)
   result = credit_check.double_every_other_number
   assert_equal [5, 8, 3, 4, 1], result
 end

 def test_it_can_deal_with_nums_over_10
   credit_check = CreditCheck.new
   credit_check.take_card_and_split(888)
   credit_check.double_every_other_number
   credit_check.get_rid_of_over_ten
   assert_equal [8, 7, 8], credit_check.mutated_card_number
 end

 def test_it_can_check_valid_cards
   credit_check = CreditCheck.new
   credit_check.take_card_and_split(4024007136512380)
   credit_check.double_every_other_number
   credit_check.get_rid_of_over_ten
   result = credit_check.validity?
   assert_equal true, result
 end

 def test_it_can_get_invalid_cards
  credit_check = CreditCheck.new
  credit_check.take_card_and_split(541801923795240)
  credit_check.double_every_other_number
  credit_check.get_rid_of_over_ten
  result = credit_check.validity?
  assert_equal false, result
 end

 def test_whole
  credit_check = CreditCheck.new
  result = credit_check.valid_number?(541801923795240)
  assert_equal false, result
 end

 def test_outputs
   credit_check = CreditCheck.new
   result = credit_check.validation_output(5541808923795240)
   assert_equal "The number 5541808923795240 is valid", result
 end

 def test_check_digit
   credit_check = CreditCheck.new
   result = credit_check.get_check_digit(7992739871)
   assert_equal 3, result
 end
end
