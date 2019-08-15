#! /usr/bin/ruby

# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

def main(l1, l2)
  p l1
  p l2

  head = ListNode.new(-1)
  first = head

  while (l1 && l2)
    if (l1.val < l2.val)
      tmp = l1.next
      first.next = l1
      l1 = tmp
    else
      tmp = l2.next
      first.next = l2
      l2 = tmp
    end
    first = first.next
  end

  if (l1.nil?)
    first.next = l2
  end

  if (l2.nil?)
    first.next = l1
  end

  p "answer----------"
  p head.next

  return head.next
end

if __FILE__ == $0

  p "hogehoe"
  ((inp1 = ListNode.new(1)).next = ListNode.new(2)).next = ListNode.new(4)
  p inp1
  ((inp2 = ListNode.new(1)).next = ListNode.new(3)).next = ListNode.new(4)
  p inp2
  ((((exp  = ListNode.new(1)).next =ListNode.new(1)).next =ListNode.new(2)).next =ListNode.new(3)).next = ListNode.new(4)
  p exp

  testcases = [
    [[inp1, inp2], exp],
#    [[], ""]
  ]

  testcases.each do |testcase|
    input = testcase[0]
    expect = testcase[1]

    puts "input  #{input}"
    puts "expect #{expect}"
    result = main(input[0], input[1])

    if (result == expect) ; puts "OK"
    else                  ; puts "NG (result: #{result})"
    end
    puts "\n"
  end
end
