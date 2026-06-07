function addTwoNumbers(
  l1: ListNode | null,
  l2: ListNode | null,
): ListNode | null {
  const dummy = new ListNode(0);
  let cur = dummy;
  let carry = 0;
  while (l1 !== null || l2 !== null || carry !== 0) {
    const x = l1 !== null ? l1.val : 0;
    const y = l2 !== null ? l2.val : 0;
    const total = x + y + carry;
    carry = Math.floor(total / 10);
    cur.next = new ListNode(total % 10);
    cur = cur.next;
    l1 = l1 !== null ? l1.next : null;
    l2 = l2 !== null ? l2.next : null;
  }
  return dummy.next;
}
