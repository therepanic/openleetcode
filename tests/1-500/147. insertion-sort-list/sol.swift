class Solution {
    func insertionSortList(_ head: ListNode?) -> ListNode? {
        var values = [Int]()
        var current = head
        while let node = current {
            values.append(node.val)
            current = node.next
        }
        values.sort()

        let dummy = ListNode(0)
        var tail: ListNode? = dummy
        for value in values {
            tail?.next = ListNode(value)
            tail = tail?.next
        }
        return dummy.next
    }
}
