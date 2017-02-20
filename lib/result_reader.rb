# Класс, отвечающий за чтение вопросов из файла

class ResultReader
  attr_reader :results

  def read_from_file(results_path)
    if !File.exist?(results_path)
      return nil
    end

    f = File.new(results_path, "r:UTF-8")
    @results = f.readlines
    f.close

    return @results
  end
end
