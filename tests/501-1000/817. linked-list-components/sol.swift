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
    func numComponents(_ head: ListNode?, _ nums: [Int]) -> Int {
        let nodeSet = Set(nums)
        var count = 0
        var inComponent = false
        var current = head
        while current != nil {
            if nodeSet.contains(current!.val) {
                if !inComponent {
                    count += 1
                    inComponent = true
                }
            } else {
                inComponent = false
            }
            current = current!.next
        }
        return count
    }
}
