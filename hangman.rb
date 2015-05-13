def draw_man(num)
  if num == 0; puts "------"
  elsif num == 1
    puts "------"
    puts "     |"
    puts "      "
    puts "      "
    puts "      "
    puts "      "
  elsif num == 2
    puts "------"
    puts "     |"
    puts "     @"
    puts "      "
    puts "      "
    puts "      "
  elsif num == 3
    puts "------"
    puts "     |"
    puts "     @"
    puts "     |"
    puts "      "
    puts "      "
  elsif num == 4
    puts "------"
    puts "     |"
    puts "     @"
    puts '    \|'
    puts "      "
    puts "      "
  elsif num == 5
    puts "------"
    puts "     |"
    puts "     @"
    puts '    \|/'
    puts "      "
    puts "      "
  elsif num == 6
    puts "------"
    puts "     |"
    puts "     @"
    puts '    \|/'
    puts "     | "
    puts "      "
    puts "      "
  elsif num == 7
    puts "------"
    puts "     |"
    puts "     @"
    puts '    \|/'
    puts "     | "
    puts '    /  '
    puts "      "
  elsif num == 8
    puts "------"
    puts "     |"
    puts "     @"
    puts '    \|/'
    puts "     | "
    puts '    / \ '
    puts "      "
  end
end

def display_guess_progress(secret_word_array, letters_guessed)
  result = " "
  secret_word_array.each do |x|
    if (letters_guessed.include? x) ==true
      result = result + x
    elsif (letters_guessed.include? x) ==false
      result = result + "_ "
    end
  end

  puts result
  puts
  puts "Letters already guessed:"
  puts letters_guessed.sort.join(',')
  puts

  win = 1
  result.each_char do |i|
    if i == "_"
      win = 0
    end
  end
  return win
end

puts "Type start when ready to begin."
user_start = gets.chomp.downcase
if user_start != "start"
  exit
end

f = File.new("english-dictionary-2.txt", "r")
words = f.read.chomp
f.close

random_word = words.split("\n")
random_word = random_word.sample.chomp
secret_word_array = random_word.split('')

num = 0
letters_guessed = [ ]
draw_man(num)
display_guess_progress(secret_word_array, letters_guessed)

while num < 8
  puts "Guess a letter. Please only guess one letter at a time, and do not repeat any letters."
  letter = gets.chomp.downcase
  letters_guessed.push(letter)

  if (secret_word_array.include? letter) ==false
    num = num +1
  end

  draw_man(num)
  win = display_guess_progress(secret_word_array, letters_guessed)

  if win == 1
    puts "You win!"
    break
  end
end

if num == 8
  puts "You lose! The word was:"
  puts random_word
end


