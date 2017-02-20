class Test
  attr_reader :yes_answers, :questions
  attr_accessor :version

  def initialize(questions_path)
    @questions = read_questions_from_file(questions_path)
    @yes_answers = 0
  end

  def ask_questions
    @questions.each do |question|
      puts question

      user_input = nil

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

  def read_questions_from_file(questions_path)
    if !File.exist?(questions_path)
      return nil
    end

    f = File.new(questions_path, "r:UTF-8")
    questions = f.readlines
    f.close

    return questions
  end
end
