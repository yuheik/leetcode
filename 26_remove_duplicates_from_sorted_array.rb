#! /usr/bin/ruby

def main(nums)
  return Array.new if nums.empty?

  index = 1
  target = nums[0]

  for i in 1..nums.length-1 do
    if target < nums[i]
      nums[index] = nums[i]
      index = index + 1
      target = nums[i]
    end
  end

  return index
end

if __FILE__ == $0
  testcases = [
    [[1,1,2], 2],
    [[0,0,1,1,1,2,2,3,3,4], 5]
  ]

  testcases.each do |testcase|
    input = testcase[0]
    expect = testcase[1]

    puts "input  #{input}"
    puts "expect #{expect}"
    result = main(input)

    if (result == expect) ; puts "OK"
    else                  ; puts "NG (result: #{result})"
    end
    puts "\n"
  end
end
