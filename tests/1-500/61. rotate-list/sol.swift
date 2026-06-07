class Solution {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil || head!.next == nil || k == 0 { return head }

        var length = 1
        var tail = head
        while tail!.next != nil {
            tail = tail!.next
            length += 1
        }

        let shift = k % length
        if shift == 0 { return head }

        tail!.next = head
        let steps = length - shift
        var newTail = head
        for _ in 1..<steps {
            newTail = newTail!.next
        }

        let newHead = newTail!.next
        newTail!.next = nil
        return newHead
    }
}
