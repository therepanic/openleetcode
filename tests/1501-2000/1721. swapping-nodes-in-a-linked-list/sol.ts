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

function swapNodes(head: ListNode | null, k: number): ListNode | null {
  if (head === null || head.next === null) {
    return head;
  }

  let temp = head;
  let firstPrev: ListNode | null = null;

  let n = 1;
  while (n < k) {
    firstPrev = temp;
    temp = temp.next;
    n++;
  }

  const first = temp;

  let second: ListNode | null = head;
  let secondPrev: ListNode | null = null;
  temp = first;
  while (temp.next !== null) {
    secondPrev = second;
    temp = temp.next;
    second = second.next;
  }

  if (firstPrev !== null) {
    firstPrev.next = second;
  }
  if (secondPrev !== null) {
    secondPrev.next = first;
  }

  const tempNext = first.next;
  first.next = second.next;
  second.next = tempNext;

  if (k === 1) {
    return second;
  }
  if (second === head) {
    return first;
  }

  return head;
}
