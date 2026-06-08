class Solution {
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        let smallDummy = ListNode(0)
        let bigDummy = ListNode(0)
        var small: ListNode? = smallDummy
        var big: ListNode? = bigDummy
        var head = head
        while head != nil {
            let next = head!.next
            head!.next = nil
            if head!.val < x {
                small!.next = head
                small = small!.next
            } else {
                big!.next = head
                big = big!.next
            }
            head = next
        }
        small!.next = bigDummy.next
        return smallDummy.next
    }
}
