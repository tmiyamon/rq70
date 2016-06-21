require 'benchmark'

module Q06
  module_function

  def run
    ans = 0

    (1..10000).select {|n| n%2 == 0 }.each do |n|
      i = n * 3 + 1

      while true
        i = if i%2 == 0
              i/2
            else
              i*3+1
            end

        if i == n
          ans += 1
          break
        end

        if i == 1
          break
        end
      end
    end

    ans
  end
end

Benchmark.bm do |x|
  x.report do
    $answer = Q06.run
  end
end

puts
puts "answer : #{$answer}"
