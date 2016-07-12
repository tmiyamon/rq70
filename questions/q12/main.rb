require 'benchmark'

module Q12
  module_function

  def solve
    i = 1
    while true
      str = yield(Math.sqrt(i).to_s)
      break if str.each_char.take(10).uniq.length == 10
      i += 1
    end

    i
  end

  def run
    [solve {|str| str.sub('.','') }, solve {|str| str.split('.')[1] }]
  end
end

Benchmark.bm do |x|
  x.report do
    $answer = Q12.run
  end
end

puts
puts "answer : #{$answer}"
