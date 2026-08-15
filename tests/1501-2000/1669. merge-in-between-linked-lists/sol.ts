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

function mergeInBetween(
  list1: ListNode | null,
  a: number,
  b: number,
  list2: ListNode | null,
): ListNode | null {
  let curr = list1;
  for (let i = 0; i < a - 1; i++) {
    curr = curr!.next;
  }
  const prev = curr;
  for (let i = 0; i < b - a + 2; i++) {
    curr = curr!.next;
  }
  prev!.next = list2;
  let tail = prev!.next;
  while (tail!.next !== null) {
    tail = tail!.next;
  }
  tail!.next = curr;
  return list1;
}
