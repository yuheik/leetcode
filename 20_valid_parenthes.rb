#! /usr/bin/ruby

PAREN = {
  '(' => ')',
  '{' => '}',
  '[' => ']'
}

def parse(s, stack)
  if (PAREN.has_key? s[0])
    stack.push(s[0])
  elsif (PAREN.has_value? s[0])
    return false if PAREN[stack.pop] != s[0]
  else
    # others. ignore.
  end

  rest = s[1..s.length-1]
  if rest.empty?
    return stack.empty?
  else
    parse(rest, stack)
  end
end

def main(s)
  return true if s.empty?
  return parse(s, Array.new)
end

if __FILE__ == $0
  testcases = [
    ["()"     , true],
    ["()[]{}" , true],
    ["(]"     , false],
    ["([)]"   , false],
    ["{[]}"   , true],
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
