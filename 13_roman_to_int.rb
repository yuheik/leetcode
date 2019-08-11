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

def main(s)
  answer = 0
  i = 0
  while (i < s.length) do
    if (i + 1 < s.length)
      p key = s[i..i+1]
      val = Units[key.to_sym]
      if (val)
        answer += val
        i = i + 2
        next
      end
    end

    val = Units[s[i].to_sym]
    answer += val
    i = i + 1
  end

  return answer
end

if __FILE__ == $0
  testcases = { "III"     => 3,
                "IV"      => 4,
                "IX"      => 9,
                "LVIII"   => 58,
                "MCMXCIV" => 1994 }

  testcases.each_pair do |key, value|
    puts "input #{key} | expect #{value}"
    result = main(key)

    if (result == value) ; puts "OK"
    else                 ; puts "NG (result: #{result})"
    end
    puts "\n"
  end
end
