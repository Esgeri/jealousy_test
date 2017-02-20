class TestResultPrinter
  attr_reader :results

  def initialize(results_path)
    @results = read_results_from_file(results_path)
  end

  def read_results_from_file(results_path)
    if !File.exist?(results_path)
      return nil
    end

    f = File.new(results_path, "r:UTF-8")
    results = f.readlines
    f.close

    return results
  end

  def print_result(test)
    case test.yes_answers
    when (30..36)
      puts @results[0]
    when (25..29)
      puts @results[1]
    when (19..24)
      puts @results[2]
    when (14..18)
      puts @results[3]
    when (9..13)
      puts @results[4]
    when (4..8)
      puts @results[5]
    when (0..3)
      puts @results[6]
    end
  end
end
