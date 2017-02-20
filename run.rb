# Тест взят http://www.syntone-spb.ru/library/article_syntone/content/4969.html

require_relative 'lib/test.rb'
require_relative 'lib/test_result_printer.rb'
require_relative 'lib/question_reader.rb'
require_relative 'lib/result_reader.rb'

# первый аргумент командной строки - имя пользователя, проходящего тест или "-v"
name = ARGV[0] ||= 'Таинственная Персона'

# приветствуем пользователя
puts "Добрый день, #{name}! Ответьте пожалуйста честно на несколько вопросов, чтобы узнать кое-что о себе."

# Записываем версию игры в константу VERSION
VERSION = "Тест \"Ваш уровень общительности\". Версия 0.1. (c) 2016 M. Esgeri\n\n"

questions_path = "#{File.dirname(__FILE__)}/data/questions.txt"
results_path = "#{File.dirname(__FILE__)}/data/results.txt"

# Создаем экземпляр класса
question_reader = QuestionReader.new
questions = question_reader.read_from_file(questions_path)

result_reader = ResultReader.new
results = result_reader.read_from_file(results_path)

# Создаем игру и прописываем ее версию с помощью сеттера version=
test = Test.new(questions)

test.version = VERSION
test.ask_questions

# Экземпляр TestResultPrinter-а нельзя создать без игры
test_result_printer = TestResultPrinter.new(results)

test_result_printer.print_result(test)
