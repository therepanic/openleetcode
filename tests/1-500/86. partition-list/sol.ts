function partition(head: ListNode | null, x: number): ListNode | null {
  const smallDummy = new ListNode(0);
  const bigDummy = new ListNode(0);
  let small = smallDummy;
  let big = bigDummy;
  while (head !== null) {
    const next = head.next;
    head.next = null;
    if (head.val < x) {
      small.next = head;
      small = small.next;
    } else {
      big.next = head;
      big = big.next;
    }
    head = next;
  }
  small.next = bigDummy.next;
  return smallDummy.next;
}
