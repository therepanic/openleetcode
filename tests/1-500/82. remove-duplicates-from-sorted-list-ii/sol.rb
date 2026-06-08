def delete_duplicates(head)
  dummy = ListNode.new(0)
  dummy.next = head
  prev = dummy
  cur = head
  while cur
    dup = false
    while cur.next && cur.val == cur.next.val
      dup = true
      cur = cur.next
    end
    if dup
      prev.next = cur.next
    else
      prev = prev.next
    end
    cur = cur.next
  end
  dummy.next
end
