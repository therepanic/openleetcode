def partition(head, x)
  small_dummy = ListNode.new(0)
  big_dummy = ListNode.new(0)
  small = small_dummy
  big = big_dummy
  while head
    nxt = head.next
    head.next = nil
    if head.val < x
      small.next = head
      small = small.next
    else
      big.next = head
      big = big.next
    end
    head = nxt
  end
  small.next = big_dummy.next
  small_dummy.next
end
