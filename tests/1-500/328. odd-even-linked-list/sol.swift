/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        guard let head = head, head.next != nil else {
            return head
        }
        
        var odd: ListNode? = head
        var even: ListNode? = head.next
        let evenHead = even
        
        while even != nil && even?.next != nil {
            odd?.next = even?.next
            odd = odd?.next
            even?.next = even?.next?.next
            even = even?.next
        }
        
        odd?.next = evenHead
        return head
    }
}
