class Question
  attr_reader :num1, :num2, :answer
  attr_writer :player_answer

  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @answer = @num1 + @num2
    @player_answer = nil
  end

  def prompt
    "What does #{@num1} plus #{@num2} equal?"
  end

  def check_answer
    if @player_answer == @answer
      true
    else
      false
    end
  end
end