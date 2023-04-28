require "colorize"
require_relative 'lib/console_interface'
require_relative 'lib/game'
# 1 Поздороваться
puts "Всем привет!Это игра Виселица.".colorize(:color => :white, :background => :red)
# 2 Загрузить случайное слово из файла
word = File.readlines("#{__dir__}/data/words.txt", chomp:true).sample
game = Game.new(word)
console_interface = ConsoleInterface.new(game)

# 3 Пока не закончилась игра
until game.over?
  # Вывести очередное состояние игры
  console_interface.print_out
  # спросить у пользователя букву
  letter = console_interface.get_input
  # обновить состояние игры
  game.play!(letter)
end
# Вывести финальное состояние игры
console_interface.print_out
