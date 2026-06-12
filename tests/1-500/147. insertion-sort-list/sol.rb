def insertion_sort_list(head)
  values = []
  while head
    values << head.val
    head = head.next
  end
  values.sort!

  dummy = ListNode.new(0)
  tail = dummy
  values.each do |value|
    tail.next = ListNode.new(value)
    tail = tail.next
  end
  dummy.next
end
