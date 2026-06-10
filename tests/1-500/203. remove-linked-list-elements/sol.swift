class Solution {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        let dummy = ListNode(0, head)
        var cur: ListNode? = dummy
        while cur?.next != nil {
            if cur!.next!.val == val { cur!.next = cur!.next!.next }
            else { cur = cur!.next }
        }
        return dummy.next
    }
}
