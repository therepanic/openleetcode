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
    func isPalindrome(_ head: ListNode?) -> Bool {
        var slow = head
        var fast = head
        
        // Step 1
        while fast != nil && fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }
        
        // Step 2
        var node: ListNode? = nil
        while slow != nil {
            let temp = slow?.next
            slow?.next = node
            node = slow
            slow = temp
        }
        
        // Step 3
        var first = head
        var second = node
        while second != nil {
            if first?.val != second?.val {
                return false
            }
            first = first?.next
            second = second?.next
        }
        
        return true
    }
}
