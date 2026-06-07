def add_two_numbers(l1, l2)
  dummy = ListNode.new(0)
  cur = dummy
  carry = 0
  while l1 || l2 || carry != 0
    x = l1 ? l1.val : 0
    y = l2 ? l2.val : 0
    total = x + y + carry
    carry = total / 10
    cur.next = ListNode.new(total % 10)
    cur = cur.next
    l1 = l1 ? l1.next : nil
    l2 = l2 ? l2.next : nil
  end
  dummy.next
end
