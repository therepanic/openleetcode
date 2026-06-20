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
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var s1 = [Int]()
        var p = l1
        while p != nil {
            s1.append(p!.val)
            p = p!.next
        }

        var s2 = [Int]()
        var q = l2
        while q != nil {
            s2.append(q!.val)
            q = q!.next
        }

        var carry = 0
        var head: ListNode? = nil
        while !s1.isEmpty || !s2.isEmpty || carry > 0 {
            var sum = carry
            if !s1.isEmpty {
                sum += s1.removeLast()
            }
            if !s2.isEmpty {
                sum += s2.removeLast()
            }
            head = ListNode(sum % 10, head)
            carry = sum / 10
        }

        while head?.val == 0 && head?.next != nil {
            head = head?.next
        }

        return head
    }
}
