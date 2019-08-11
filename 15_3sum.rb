#! /usr/bin/ruby

def try1(nums)
  answer = Hash.new
  for i in 0..(nums.length - 1)
    for j in (i+1)..(nums.length - 1)
      for k in (j+1)..(nums.length - 1)
        if nums[i] + nums[j] + nums[k] == 0
          values = [nums[i], nums[j], nums[k]].sort
          key = values.join.to_sym
          answer[key] = values
        end
      end
    end
  end
  return answer.values
end

def try2(nums)
  p nums.sort!

  answers = Array.new
  for i in 0..(nums.length-2) do
    j = i + 1
    k = nums.length - 1
    p "+ #{i}, #{j}, #{k}"

    while (j < k) do
      a = nums[i]
      b = nums[j]
      c = nums[k]

      sum = a + b + c
      if (sum == 0)
        p answers.push([a, b, c])
        j = j + 1
        while (j < k && nums[j] == nums[j-1])
          j = j  + 1
        end
        break
      elsif (sum < 0)
        j = j + 1
      else
        k = k -1
      end

     p "#{i}, #{j}, #{k}"
    end
  p "- #{i}, #{j}, #{k}"
  end

  p "answers: #{answers}"

  return answers
end

def try3(nums)
  nums.sort!
  dump(nums)

  i = j = k = -1

  answer = Array.new
  for i in 0..(nums.length - 1)
    if (i > 0 && nums[i-1] == nums[i])
      p "breakA: #{i}, #{j}, #{k}, #{nums[i-1]}, #{nums[i]}"
      next
    end


    j = i+1
    while j < nums.length do
      if (!answer.empty? &&
          nums[i] == answer.last[0] &&
          nums[j] == answer.last[1])
        p "breakB: #{i}, #{j}, #{k}, #{answer.last}, #{nums[j]}"
        j = j + 1
        next
      end

      k = j + 1
      while k < nums.length do
#        p "current: #{i}, #{j}, #{k} | [#{nums[i]}, #{nums[j]}, #{nums[k]} | #{nums[i] + nums[j] + nums[k]}"


        if (nums[i] + nums[j] + nums[k] == 0)
          p "push: #{i}, #{j}, #{k}"

          answer.push([nums[i], nums[j], nums[k]])
          k = k + 1
          while (k < nums.length && nums[k-1] == nums[k])
            k = k+1
          end
        else
          k = k + 1
        end
      end
      j = j + 1
    end
  end
  return answer
end

def dump(array)
  values = array.map { |val| sprintf("% 2d, ", val) }.join
  indexs = (0..array.length-1).to_a.map { |val| sprintf("% 2d, ", val) }.join

  puts values
  puts indexs
  puts
end

def binary_search(sorted_array, target)
  # p ">>>>>"
  # p sorted_array
  # p target

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


def main(nums)
  nums.sort!
  dump(nums)

  i = j = k = -1
  last = nil

  answer = Array.new
  for i in 0..(nums.length - 1)
    if (i > 0 && nums[i-1] == nums[i])
#      p "breakA: #{i}, #{j}, #{k}, #{nums[i-1]}, #{nums[i]}"
      next
    end


    j = i+1
    while j < nums.length do
      if (last &&
          nums[i] == last[0] &&
          nums[j] == last[1])
#        p "breakB: #{i}, #{j}, #{k}, #{answer.last}, #{nums[j]}"
        j = j + 1
        next
      end

      target = -(nums[i]+nums[j])
      k = j + 1
      while k < nums.length do
#        p "current: #{i}, #{j}, #{k} | [#{nums[i]}, #{nums[j]}, #{nums[k]} | #{nums[i] + nums[j] + nums[k]}"

        result = binary_search(nums[k..nums.length-1], target)


        if (result)
          k = k + result
          last = [[nums[i], nums[j], nums[k]]
          answer.push(last)

#          p "push: #{i}, #{j}, #{k} | [#{nums[i]}, #{nums[j]}, #{nums[k]} | #{nums[i] + nums[j] + nums[k]}"

          break
        else
          k = k + 1
        end
      end


      j = j + 1
    end
  end


  return answer
end


if __FILE__ == $0
  testcases = [
    [[-4,-2,-2,-2,0,1,2,2,2,3,3,4,4,6,6], [[-4,-2,6],[-4,0,4],[-4,1,3],[-4,2,2],[-2,-2,4],[-2,0,2]]],
    [[3,0,-2,-1,1,2], [[-2,-1,3],[-2,0,2],[-1,0,1]]],
    [[-1, 0, 1, 2, -1, -4], [[-1, 0, 1], [-1, -1, 2]]],
    [[0,0,0,0], [0,0,0]],
  ]

  testcases.each do |testcase|
    input = testcase[0]
    expect = testcase[1]

    puts "-------------------------------------------"
    puts "input  : #{input}"
    puts "expect : #{expect}"
    puts

    result = main(input)

    if (result == expect) ; puts "OK"
    else                  ; puts "NG (result: #{result})"
    end
    puts "\n"
  end
end
