class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        let dummy = ListNode(0, head)
        var prev: ListNode? = dummy
        var cur = head
        while cur != nil {
            var dup = false
            while cur?.next != nil && cur!.val == cur!.next!.val {
                dup = true
                cur = cur!.next
            }
            if dup { prev!.next = cur!.next }
            else { prev = prev!.next }
            cur = cur!.next
        }
        return dummy.next
    }
}
