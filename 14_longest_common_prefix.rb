#! /usr/bin/ruby

def is_same?(strs, index, ch)
  strs.each do |str|
    return false if index == str.length
    return false if str[index] != ch
  end
  return true
end

def main(strs)
  return "" if strs.empty?

  base = strs[0]
  rest = strs[1..strs.length-1]

  prefix = ""
  for i in 0..(base.length-1) do
    ch = base[i]
    break unless is_same?(rest, i, ch)
    prefix += ch
  end

  return prefix
end

if __FILE__ == $0
  testcases = [
    [["flower","flow","flight"], "fl"],
    [["dog","racecar","car"], ""],
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
