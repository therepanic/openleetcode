function swapPairs(head: ListNode | null): ListNode | null {
  if (head === null || head.next === null) return head;
  const second = head.next;
  head.next = swapPairs(second.next);
  second.next = head;
  return second;
}
