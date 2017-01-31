# Тест взят http://www.syntone-spb.ru/library/article_syntone/content/4969.html

require_relative 'lib/test.rb'
require_relative 'lib/test_result_printer.rb'

version = "Тест \"Ваш уровень общительности\". Версия 0.1. (c) 2016 M. Esgeri\n\n"

# первый аргумент командной строки - имя пользователя, проходящего тест или "-v"
name = ARGV[0]

name = name.encode('UTF-8') if Gem.win_platform? && ARGV[0]

# пользователь может забыть передать аргумент, но как-то мы должны к нему обратиться
if name.nil?
  name = 'Таинственная Персона'
elsif name == '-v'
  puts version
  exit
end

# приветствуем пользователя
puts "Добрый день, #{name}! Ответьте пожалуйста честно на несколько вопросов, чтобы узнать кое-что о себе."

test = Test.new
test_result_printer = TestResultPrinter.new

test.ask_questions

test_result_printer.print_result(test)
