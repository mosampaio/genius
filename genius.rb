class Genius
  attr_reader :sequence
  def initialize
    @sequence = []
    @guessPosition = 0
    increment
  end

  def increment
  	sequence.push(rand(4))
  end

  def guess(p)
    throw :done if sequence[@guessPosition] != p
    finish = @guessPosition == sequence.length-1
    if finish
    	increment
    	@guessPosition = 0
    else
    	@guessPosition += 1
    end
    finish
  end

end

genius = Genius.new
catch (:done) do
  loop do
    system "clear"
    genius.sequence.each do |x|
      puts "#{x}"
      sleep 0.75
      
    end
    system "clear"
    puts "\e[0mDigite a seq."
    while !genius.guess(gets.chomp.to_i) do
   		puts ","
    end

  end
end
system "clear"
puts "Fim do jogo."
