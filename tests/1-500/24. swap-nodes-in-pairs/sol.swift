class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        if head == nil || head!.next == nil { return head }
        let second = head!.next
        head!.next = swapPairs(second!.next)
        second!.next = head
        return second
    }
}
