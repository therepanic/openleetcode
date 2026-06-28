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
    func splitListToParts(_ head: ListNode?, _ k: Int) -> [ListNode?] {
        // Step 1: Calculate the length of the linked list
        var length = 0
        var current = head
        while current != nil {
            length += 1
            current = current?.next
        }
        
        // Step 2: Determine the size of each part
        let partSize = length / k
        let largerParts = length % k
        
        // Initialize an array to store the results
        var result = [ListNode?]()
        
        // Step 3: Split the linked list into parts
        current = head
        for i in 0..<k {
            let sublistSize = i < largerParts ? partSize + 1 : partSize
            if sublistSize == 0 {
                result.append(nil)
            } else {
                let sublistHead = current
                for _ in 0..<(sublistSize - 1) {
                    current = current?.next
                }
                let nextNode = current?.next
                current?.next = nil
                result.append(sublistHead)
                current = nextNode
            }
        }
        
        return result
    }
}
