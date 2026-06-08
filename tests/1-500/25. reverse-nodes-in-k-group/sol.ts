function reverseKGroup(head: ListNode | null, k: number): ListNode | null {
  const dummy = new ListNode(0, head);
  let groupPrev: ListNode | null = dummy;
  while (true) {
    const kth = getKthNode(groupPrev, k);
    if (kth === null) break;
    const groupNext = kth.next;
    let prev: ListNode | null = groupNext;
    let cur: ListNode | null = groupPrev!.next;
    while (cur !== groupNext) {
      const tmp = cur!.next;
      cur!.next = prev;
      prev = cur;
      cur = tmp;
    }
    const tmp = groupPrev!.next;
    groupPrev!.next = kth;
    groupPrev = tmp;
  }
  return dummy.next;
}

function getKthNode(start: ListNode | null, k: number): ListNode | null {
  while (start !== null && k > 0) {
    start = start.next;
    k--;
  }
  return start;
}
