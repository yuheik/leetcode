#! /usr/bin/ruby

def main(input)
  p input

  return
end

if __FILE__ == $0
  testcases = [
    [[], ""],
    [[], ""]
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
