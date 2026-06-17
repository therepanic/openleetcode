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

function isPalindrome(head: ListNode | null): boolean {
    let slow = head;
    let fast = head;
    
    // Step 1
    while (fast !== null && fast.next !== null) {
        fast = fast.next.next;
        slow = slow!.next;
    }
    
    // Step 2
    let node: ListNode | null = null;
    while (slow !== null) {
        const temp = slow.next;
        slow.next = node;
        node = slow;
        slow = temp;
    }
    
    // Step 3
    let first = head;
    let second = node;
    while (second !== null) {
        if (first!.val !== second.val) {
            return false;
        }
        first = first!.next;
        second = second.next;
    }
    
    return true;
};
