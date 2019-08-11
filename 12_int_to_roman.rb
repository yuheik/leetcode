#! /usr/bin/ruby


Units = {
  :I  => 1,
  :IV => 4,
  :V  => 5,
  :IX => 9,
  :X  => 10,
  :XL => 40,
  :L  => 50,
  :XC => 90,
  :C  => 100,
  :CD => 400,
  :D  => 500,
  :CM => 900,
  :M  => 1000,
}

def calc(num, unit_sym)
#  p "calc(#{num}, #{unit_sym})"

  return "", 0 if num == 0

  val = Units[unit_sym]
  result = num / val
  rest   = num % val

  str = ""
  result.times { str += unit_sym.to_s }
#  p "retval #{str}, #{rest}"
  return str, rest
end

# @param {Integer} num
# @return {String}
def int_to_roman(num)
  val = Hash.new

  val[:M],  rest = calc(num,  :M)
  val[:CM], rest = calc(rest, :CM)
  val[:D],  rest = calc(rest, :D)
  val[:CD], rest = calc(rest, :CD)
  val[:C],  rest = calc(rest, :C)
  val[:XC], rest = calc(rest, :XC)
  val[:L],  rest = calc(rest, :L)
  val[:XL], rest = calc(rest, :XL)
  val[:X],  rest = calc(rest, :X)
  val[:IX], rest = calc(rest, :IX)
  val[:V],  rest = calc(rest, :V)
  val[:IV], rest = calc(rest, :IV)
  val[:I],  rest = calc(rest, :I)

  answer = ""
  answer += val[:M];
  answer += val[:CM];
  answer += val[:D];
  answer += val[:CD];
  answer += val[:C];
  answer += val[:XC];
  answer += val[:L];
  answer += val[:XL];
  answer += val[:X];
  answer += val[:IX];
  answer += val[:V];
  answer += val[:IV];
  answer += val[:I];

  return answer
end

if __FILE__ == $0
  testcases = { "III"     => 3,
                "IV"      => 4,
                "IX"      => 9,
                "LVIII"   => 58,
                "MCMXCIV" => 1994 }

  testcases.each_pair do |key, value|
    puts "input #{value} | expect #{key}"
    result = int_to_roman(value)

    if (result == key) ; puts "OK"
    else               ; puts "NG (result: #{result})"
    end
    puts "\n"
  end
end
