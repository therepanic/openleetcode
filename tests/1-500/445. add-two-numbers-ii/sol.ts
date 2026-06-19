/**
 * Definition for singly-linked list.
 * class ListNode {
 *     val: number
 *     next: ListNode | null
 *     constructor(val?: number, next?: ListNode | null) {
 *         this.val = (val===undefined ? 0 : val)
 *         this.next = (next===undefined ? null : next)
 *     }
 * }
 */

function addTwoNumbers(
  l1: ListNode | null,
  l2: ListNode | null,
): ListNode | null {
  let s1 = "";
  while (l1) {
    s1 += l1.val.toString();
    l1 = l1.next;
  }

  let s2 = "";
  while (l2) {
    s2 += l2.val.toString();
    l2 = l2.next;
  }

  const r = (BigInt(s1) + BigInt(s2)).toString();

  const dummy = new ListNode(0);
  let cur = dummy;

  for (const x of r) {
    cur.next = new ListNode(parseInt(x));
    cur = cur.next;
  }

  return dummy.next;
}
