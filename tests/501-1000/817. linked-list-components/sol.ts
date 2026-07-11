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

function numComponents(head: ListNode | null, nums: number[]): number {
  const nodeSet = new Set(nums);
  let count = 0;
  let inComponent = false;
  while (head !== null) {
    if (nodeSet.has(head.val)) {
      if (!inComponent) {
        count++;
        inComponent = true;
      }
    } else {
      inComponent = false;
    }
    head = head.next;
  }
  return count;
}
