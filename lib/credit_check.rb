require 'pry'

class CreditCheck

  attr_reader :og_card_number,
              :doubled_card_number,
              :mutated_card_number,
              :check_sum_array

   def initialize
     @og_card_number = []
     @mutated_card_number = []
     @doubled_card_number = []
     @check_sum_array = []
     terminal_interface
   end

   def take_card_and_split(card_number)
     @og_card_number = card_number.digits
   end

   def double_every_other_number
     @og_card_number.each_with_index do |number, index|
       if index.odd? == true
        @doubled_card_number << number * 2
       else
        @doubled_card_number << number
       end
     end
     return @doubled_card_number
   end

   def get_rid_of_over_ten
     @doubled_card_number.each do |number|
       if number > 9
        @mutated_card_number << number - 9
       else
        @mutated_card_number << number
       end
     end
     return @mutated_card_number
   end

   def validity?
     if @mutated_card_number.sum % 10 == 0
       true
     else
       false
     end
   end

   def valid_number?(card_number)
     take_card_and_split(card_number)
     double_every_other_number
     get_rid_of_over_ten
     validity?
   end

   def validation_output(cardnumber)
     if valid_number?(cardnumber) == true
       print "The number #{cardnumber} is valid \n"
     else
       print "The number #{cardnumber} is invalid \n"
     end
   end

   def get_check_digit(cardnumber)
     mutated = []
     @check_sum_array = cardnumber.digits.reverse
     @check_sum_array.each_with_index do |number, index|
       if (index + 1) % 2 == 0
        mutated << number * 2
       else
         mutated << number
       end
     end
     result = []
     mutated.each do |number|
       if number > 9
         result << number - 9
       else
         result << number
       end
     end
     array_sum = result.sum * 9
     array_sum % 10
   end

   def terminal_interface
     print "Welcome Human. Enter a credit card to be validated \n"
     input_2 = "POINTLESS VARIABLE ASSIGNMENT!!!"
        while input_2 != "n"
     user_input = gets.chomp.to_i
     validation_output(user_input)
     print "Another card to be validated? y/n \n"
     input_2 = gets.chomp
    end
    abort("You're cards are either invalid or valid.  Now you know, and knowing is half the battle.")
   end
 end
