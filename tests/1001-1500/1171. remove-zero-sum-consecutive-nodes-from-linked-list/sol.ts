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

function removeZeroSumSublists(head: ListNode | null): ListNode | null {
  const dummy = new ListNode(0);
  dummy.next = head;
  let prefixSum = 0;
  const seen: Map<number, ListNode> = new Map();

  let curr: ListNode | null = dummy;
  while (curr !== null) {
    prefixSum += curr.val;
    seen.set(prefixSum, curr);
    curr = curr.next;
  }

  prefixSum = 0;
  curr = dummy;
  while (curr !== null) {
    prefixSum += curr.val;
    curr.next = seen.get(prefixSum)!.next;
    curr = curr.next;
  }

  return dummy.next;
}
