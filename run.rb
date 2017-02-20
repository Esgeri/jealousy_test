# Тест взят http://www.syntone-spb.ru/library/article_syntone/content/4969.html

require_relative 'lib/test.rb'
require_relative 'lib/test_result_printer.rb'

# первый аргумент командной строки - имя пользователя, проходящего тест или "-v"
name = ARGV[0] ||= 'Таинственная Персона'

# приветствуем пользователя
puts "Добрый день, #{name}! Ответьте пожалуйста честно на несколько вопросов, чтобы узнать кое-что о себе."

# Записываем версию игры в константу VERSION
VERSION = "Тест \"Ваш уровень общительности\". Версия 0.1. (c) 2016 M. Esgeri\n\n"

questions_path = "#{File.dirname(__FILE__)}/data/questions.txt"
results_path = "#{File.dirname(__FILE__)}/data/results.txt"

test = Test.new(questions_path)
test.version = VERSION
test.ask_questions

test_result_printer = TestResultPrinter.new(results_path)
puts "\nВаш результат теста (набранные баллы: #{test.yes_answers}):"
test_result_printer.print_result(test)
