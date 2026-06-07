function reverseBetween(
  head: ListNode | null,
  left: number,
  right: number,
): ListNode | null {
  const dummy = new ListNode(0, head);
  let prev: ListNode = dummy;

  for (let i = 1; i < left; i++) {
    prev = prev.next!;
  }

  const curr = prev.next!;
  for (let i = 0; i < right - left; i++) {
    const node = curr.next!;
    curr.next = node.next;
    node.next = prev.next;
    prev.next = node;
  }

  return dummy.next;
}
