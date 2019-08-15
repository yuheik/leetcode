#! /usr/bin/ruby

def main(n)
  combinations = Array.new
  generateAll(Array.new(2*n), 0, combinations)
  p combinations
  return combinations
end

def generateAll(current, pos, result)
  p "#{sprintf("%-6s", current.join)} #{pos} #{(pos != 6)?"-":valid(current)?"O":"X"}"

  if (pos == current.length)
    result.push(current.join) if valid(current)
  else
    current[pos] = '('
    generateAll(current.dup, pos+1, result)

    current[pos] = ')'
    generateAll(current.dup, pos+1, result)
  end
end

def valid(current)
  balance = 0
  current.each do |ch|
    if (ch == '(')
      balance = balance + 1
    else
      balance = balance - 1
    end

    return false if balance < 0
  end

  return (balance == 0)
end


if __FILE__ == $0
  testcases = [
    [3, ["((()))",
         "(()())",
         "(())()",
         "()(())",
         "()()()"]],
#    [[], ""]
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
