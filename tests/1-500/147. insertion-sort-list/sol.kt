class Solution {
    fun insertionSortList(head: ListNode?): ListNode? {
        val values = mutableListOf<Int>()
        var current = head
        while (current != null) {
            values.add(current.`val`)
            current = current.next
        }
        values.sort()

        val dummy = ListNode(0)
        var tail = dummy
        for (value in values) {
            tail.next = ListNode(value)
            tail = tail.next!!
        }
        return dummy.next
    }
}
