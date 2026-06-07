function deleteDuplicates(head: ListNode | null): ListNode | null {
  const dummy = new ListNode(0, head);
  let prev: ListNode | null = dummy;
  let cur = head;
  while (cur !== null) {
    let dup = false;
    while (cur.next !== null && cur.val === cur.next.val) {
      dup = true;
      cur = cur.next;
    }
    if (dup) prev!.next = cur.next;
    else prev = prev!.next;
    cur = cur.next;
  }
  return dummy.next;
}
