class Player
  attr_reader :color
  
  def initialize(color)
    @color = color
  end

  def get_pos
    input = gets.chomp
    puts input
    translate_input(input)
  end

  def translate_input(input)
    split_input = input.split('')
    x = 8 - split_input.last.to_i
    y = case split_input.first.downcase
        when 'a'
          0
        when 'b'
          1
        when 'c'
          2
        when 'd'
          3
        when 'e'
          4
        when 'f'
          5
        when 'g'
          6
        when 'h'
          7
        else
          puts 'input does not work'
        end

    [x, y]
  end
end