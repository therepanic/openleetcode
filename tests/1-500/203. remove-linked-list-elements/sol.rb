def remove_elements(head, val)
  dummy = ListNode.new(0)
  dummy.next = head
  cur = dummy
  while cur.next
    if cur.next.val == val
      cur.next = cur.next.next
    else
      cur = cur.next
    end
  end
  dummy.next
end
