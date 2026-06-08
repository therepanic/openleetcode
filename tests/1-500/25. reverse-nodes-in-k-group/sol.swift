class Solution {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        let dummy = ListNode(0, head)
        var groupPrev: ListNode? = dummy
        while true {
            let kth = getKthNode(groupPrev, k)
            if kth == nil { break }
            let groupNext = kth!.next
            var prev: ListNode? = groupNext
            var cur = groupPrev!.next
            while cur !== groupNext {
                let tmp = cur!.next
                cur!.next = prev
                prev = cur
                cur = tmp
            }
            let tmp = groupPrev!.next
            groupPrev!.next = kth
            groupPrev = tmp
        }
        return dummy.next
    }

    private func getKthNode(_ start: ListNode?, _ k: Int) -> ListNode? {
        var start = start
        var k = k
        while start != nil && k > 0 {
            start = start!.next
            k -= 1
        }
        return start
    }
}
