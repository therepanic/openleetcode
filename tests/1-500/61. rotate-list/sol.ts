function rotateRight(head: ListNode | null, k: number): ListNode | null {
  if (head === null || head.next === null || k === 0) return head;

  let length = 1;
  let tail = head;
  while (tail.next !== null) {
    tail = tail.next;
    length++;
  }

  k %= length;
  if (k === 0) return head;

  tail.next = head;
  const steps = length - k;
  let newTail = head;
  for (let i = 1; i < steps; i++) {
    newTail = newTail.next!;
  }

  const newHead = newTail.next;
  newTail.next = null;
  return newHead;
}
