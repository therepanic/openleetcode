function deleteDuplicates(head: ListNode | null): ListNode | null {
  let cur = head;
  while (cur !== null && cur.next !== null) {
    if (cur.val === cur.next.val) cur.next = cur.next.next;
    else cur = cur.next;
  }
  return head;
}
