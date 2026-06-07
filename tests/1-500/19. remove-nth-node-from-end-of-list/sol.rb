def remove_nth_from_end(head, n)
  ptr = temp = head
  n.times { ptr = ptr.next }
  return head.next if !ptr
  while ptr.next
    ptr = ptr.next
    temp = temp.next
  end
  temp.next = temp.next.next
  head
end
