require 'benchmark'

module Q00
  module_function

  def solve n, line
    if line.length > 1 && line[-1] == 1 &&  line[-2] == 1
      return 0
    end

    if n == 0
      return 1
    end

    return solve(n - 1, line + [0]) + solve(n - 1, line + [1])
  end

  def run
    solve(30, [])
  end
end

Benchmark.bm do |x|
  x.report do
    $answer = Q00.run
  end
end

puts
puts "answer : #{$answer}"
