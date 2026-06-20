function insertionSortList(head: ListNode | null): ListNode | null {
  const values: number[] = [];
  for (let cur = head; cur !== null; cur = cur.next) values.push(cur.val);
  values.sort((a, b) => a - b);
  const dummy = new ListNode(0);
  let tail = dummy;
  for (const value of values) {
    tail.next = new ListNode(value);
    tail = tail.next;
  }
  return dummy.next;
}
