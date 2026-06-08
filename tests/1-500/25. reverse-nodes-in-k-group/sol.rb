def reverse_k_group(head, k)
  dummy = ListNode.new(0)
  dummy.next = head
  group_prev = dummy
  loop do
    kth = get_kth_node(group_prev, k)
    break unless kth
    group_next = kth.next
    prev = group_next
    cur = group_prev.next
    while cur != group_next
      tmp = cur.next
      cur.next = prev
      prev = cur
      cur = tmp
    end
    tmp = group_prev.next
    group_prev.next = kth
    group_prev = tmp
  end
  dummy.next
end

def get_kth_node(start, k)
  while start && k > 0
    start = start.next
    k -= 1
  end
  start
end
