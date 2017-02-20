# Класс, отвечающий за чтение вопросов из файла

class QuestionReader
  attr_reader :questions

  def read_from_file(questions_path)
    if !File.exist?(questions_path)
      return nil
    end

    f = File.new(questions_path, "r:UTF-8")
    @questions = f.readlines
    f.close

    return @questions
  end
end
