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
    func mergeInBetween(_ list1: ListNode?, _ a: Int, _ b: Int, _ list2: ListNode?) -> ListNode? {
        var curr = list1
        for _ in 0..<(a-1) {
            curr = curr?.next
        }
        let prev = curr
        for _ in 0..<(b-a+2) {
            curr = curr?.next
        }
        prev?.next = list2
        var tail = prev?.next
        while tail?.next != nil {
            tail = tail?.next
        }
        tail?.next = curr
        return list1
    }
}
