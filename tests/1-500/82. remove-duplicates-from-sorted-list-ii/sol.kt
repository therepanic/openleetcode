class Solution {
    fun deleteDuplicates(head: ListNode?): ListNode? {
        val dummy = ListNode(0)
        dummy.next = head
        var prev: ListNode? = dummy
        var current = head

        while (current != null) {
            var duplicate = false
            while (current?.next != null && current.`val` == current.next!!.`val`) {
                duplicate = true
                current = current.next
            }
            if (duplicate) {
                prev?.next = current?.next
            } else {
                prev = prev?.next
            }
            current = current?.next
        }

        return dummy.next
    }
}
