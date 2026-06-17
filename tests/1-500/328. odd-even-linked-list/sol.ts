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

function oddEvenList(head: ListNode | null): ListNode | null {
    if (!head || !head.next) {
        return head;
    }
    
    let odd: ListNode | null = head;
    let even: ListNode | null = head.next;
    const evenHead: ListNode | null = even;
    
    while (even !== null && even.next !== null) {
        odd.next = even.next;
        odd = odd.next;
        even.next = even.next.next;
        even = even.next;
    }
    
    odd.next = evenHead;
    return head;
};
