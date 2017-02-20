class TestResultPrinter
  attr_reader :results

  def initialize(results)
    @results = results
  end

  def print_result(test)
    puts "\nВаш результат теста (набранные баллы: #{test.yes_answers}):"

    case test.yes_answers
    when (30..36)
      puts results[0]
    when (25..29)
      puts results[1]
    when (19..24)
      puts results[2]
    when (14..18)
      puts results[3]
    when (9..13)
      puts results[4]
    when (4..8)
      puts results[5]
    when (0..3)
      puts results[6]
    end
  end
end
