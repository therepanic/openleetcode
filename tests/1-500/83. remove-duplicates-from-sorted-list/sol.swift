class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var cur = head
        while cur != nil && cur?.next != nil {
            if cur!.val == cur!.next!.val { cur!.next = cur!.next!.next }
            else { cur = cur!.next }
        }
        return head
    }
}
