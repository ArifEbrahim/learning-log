class FizzBuzz
  def play(number)
    string = ""
    string << "Fizz" if is_divisible_by?(3, number)
    string << "Buzz" if is_divisible_by?(5, number)
    string.empty? ? number : string
  end

  private

  def is_divisible_by?(divisor, number)
    p "divisor = #{divisor}"
    p "number = #{number}"
    number % divisor == 0
  end
end
