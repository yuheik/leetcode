#! /usr/bin/ruby

def main(input)
  p input

  return
end

def dump(array)
  values = array.map { |val| sprintf("% 2d, ", val) }.join
  indexs = (0..array.length-1).to_a.map { |val| sprintf("% 2d, ", val) }.join

  puts values
  puts indexs
  puts
end

def binary_search(sorted_array, target)
  low = 0
  high = sorted_array.length - 1

  while low <= high
    mid = (low + (high - low)/2)

    return mid if target == sorted_array[mid]
    if (target < sorted_array[mid])
      high = mid - 1
    else
      low = mid + 1
    end
  end

  return nil
end

if __FILE__ == $0
  testcases = [
    [[], ""],
    [[], ""]
  ]

  testcases.each do |testcase|
    input = testcase[0]
    expect = testcase[1]

    puts "input #{input} | expect #{expect}"
    result = main(input)

    if (result == expect) ; puts "OK"
    else                  ; puts "NG (result: #{result})"
    end
    puts "\n"
  end
end
