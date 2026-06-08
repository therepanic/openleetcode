def rotate_right(head, k)
  return head if head.nil? || head.next.nil? || k == 0

  len = 1
  tail = head
  while tail.next
    tail = tail.next
    len += 1
  end

  k %= len
  return head if k == 0

  tail.next = head
  steps = len - k
  new_tail = head
  (steps - 1).times do
    new_tail = new_tail.next
  end

  new_head = new_tail.next
  new_tail.next = nil
  new_head
end
