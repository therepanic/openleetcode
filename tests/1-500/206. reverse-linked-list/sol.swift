class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var current = head
        var prev: ListNode? = nil
        while current != nil {
            let next = current!.next
            current!.next = prev
            prev = current
            current = next
        }
        return prev
    }
}
