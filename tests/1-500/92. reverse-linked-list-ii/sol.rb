def reverse_between(head, left, right)
  dummy = ListNode.new(0, head)
  prev = dummy

  (left - 1).times do
    prev = prev.next
  end

  curr = prev.next
  (right - left).times do
    node = curr.next
    curr.next = node.next
    node.next = prev.next
    prev.next = node
  end

  dummy.next
end
