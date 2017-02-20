class Test
  attr_reader :yes_answers, :questions
  attr_accessor :version

  def initialize(questions)
    @questions = questions
    @yes_answers = 0
  end

  def ask_questions
    # цикл по массиву questions - каждый элемент записывается в специальную переменную item,
    @questions.each do |question|
      puts question # вывели на экран след. вопрос

      # переменная, куда будет сохраняться ответ пользователя, прочитанный из консоли
      user_input = nil

      #  цикл повторяющий просьбу ввести ответ до тех пор, пока не будет введен правильный ответ
      until %w(да нет иногда).include? user_input
        puts "введите 'да', 'нет' или 'иногда' и нажмите Enter"

        user_input = STDIN.gets.chomp.downcase
      end

      case user_input
      when 'да'
        @yes_answers += 2
      when 'иногда'
        @yes_answers += 1
      end
    end
  end
end
