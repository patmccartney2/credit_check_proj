require 'pry'

class CreditCheck


  attr_reader :ccnumber


  def initialize
    @ccnumber = []
  end

  def valid?(card_number)
    ccarray = card_number.digits
    ccarray.map.with_index do |number, index|
      if (index + 1) % 2 == 0
        number * 2
      else
        number
      end
    end
    ccarray.map do |number|
      if number > 10
        number - 9
      end
    end
    
  end




end
