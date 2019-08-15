#! /usr/bin/ruby

class Fixnum
  def to_sym
    return self.to_s.to_sym
  end
end

PHONE_CODE = {
  2.to_sym => %w(a b c),
  3.to_sym => %w(d e f),
  4.to_sym => %w(g h i),
  5.to_sym => %w(j k l),
  6.to_sym => %w(m n o),
  7.to_sym => %w(p q r s),
  8.to_sym => %w(t u v),
  9.to_sym => %w(w x y z)
}

def try1(digits)
  answers = Array.new
  digits.each_char do |ch|
    if answers.empty?
      answers = PHONE_CODE[ch.to_sym].dup
    else
      tmp = Array.new
      while !answers.empty?
        val = answers.shift
        PHONE_CODE[ch.to_sym].each do |letter|
          tmp.push(val + letter)
        end
      end
      answers = tmp
    end
  end
end

def combination(answers, comb, digits)
  if digits.empty?
    answers.push(comb) unless comb.empty?
  else
    ch = digits[0]
    PHONE_CODE[ch.to_sym].each do |letter|
      combination(answers, comb + letter, digits[1..digits.length]).dup
    end
  end
  return answers
end

def main(digits)
  answers = Array.new
  answers = combination(answers, "", digits)

  p answers
  return answers
end

if __FILE__ == $0
  testcases = [
    ["", []],
    ["23", ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"]],
    ["2", ["a","b","c"]]
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
