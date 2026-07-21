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
    func removeZeroSumSublists(_ head: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        dummy.next = head
        var prefixSum = 0
        var seen: [Int: ListNode] = [:]

        var curr: ListNode? = dummy
        while curr != nil {
            prefixSum += curr!.val
            seen[prefixSum] = curr
            curr = curr!.next
        }

        prefixSum = 0
        curr = dummy
        while curr != nil {
            prefixSum += curr!.val
            curr!.next = seen[prefixSum]!.next
            curr = curr!.next
        }

        return dummy.next
    }
}
