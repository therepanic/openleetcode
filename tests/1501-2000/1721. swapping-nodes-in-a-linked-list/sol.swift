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
    func swapNodes(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }

        var temp = head
        var firstPrev: ListNode?

        var n = 1
        while n < k {
            firstPrev = temp
            temp = temp?.next
            n += 1
        }

        let first = temp

        var second = head
        var secondPrev: ListNode?
        temp = first
        while temp?.next != nil {
            secondPrev = second
            temp = temp?.next
            second = second?.next
        }

        firstPrev?.next = second
        secondPrev?.next = first

        let tempNext = first?.next
        first?.next = second?.next
        second?.next = tempNext

        if k == 1 {
            return second
        }
        if second === head {
            return first
        }

        return head
    }
}
