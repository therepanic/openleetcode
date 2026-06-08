class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        var cur = dummy
        var a = l1
        var b = l2
        var carry = 0
        while a != nil || b != nil || carry != 0 {
            let x = a?.val ?? 0
            let y = b?.val ?? 0
            let total = x + y + carry
            carry = total / 10
            cur.next = ListNode(total % 10)
            cur = cur.next!
            a = a?.next
            b = b?.next
        }
        return dummy.next
    }
}
