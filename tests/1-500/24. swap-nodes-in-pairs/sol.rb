def swap_pairs(head)
  return head if !head || !head.next
  temp = head.next
  head.next = swap_pairs(temp.next)
  temp.next = head
  temp
end
