#! /usr/bin/ruby
# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

def main(head, n)

  length = 0
  first = head.dup
  while (first)
    length = length + 1
    first = first.next
  end
  p "length #{length}"

  dummy = ListNode.new(-1)
  dummy.next = head
  tmp = dummy

  if (length - n < 1)
    p tmp.val
    tmp.next = tmp.next.next
  else
    for i in 1..(length - n) do
      tmp = tmp.next
    end
    p tmp.val
    tmp.next = tmp.next.next
  end
  p tmp

  p "answer"
  first = dummy.next
  while (first)
    p first.val
    first = first.next
  end

  return dummy.next

end

if __FILE__ == $0
  ((((inp = ListNode.new(1)).next = ListNode.new(2)).next = ListNode.new(3)).next = ListNode.new(4)).next = ListNode.new(5)

  ((((exp = ListNode.new(1)).next = ListNode.new(2)).next = ListNode.new(3)).next = ListNode.new(5))

  # inp = ListNode.new(1)
  # exp = nil

  testcases = [
    [[inp, 2], exp]
  ]

  testcases.each do |testcase|
    input = testcase[0]
    expect = testcase[1]

    puts "input #{input} | expect #{expect}"
    result = main(*input)

    if (result == expect) ; puts "OK"
    else                  ; puts "NG (result: #{result})"
    end
    puts "\n"
  end
end
