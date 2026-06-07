class Solution {
    fun partition(head: ListNode?, x: Int): ListNode? {
        val smallDummy = ListNode(0)
        val bigDummy = ListNode(0)
        var small = smallDummy
        var big = bigDummy
        var current = head

        while (current != null) {
            val next = current.next
            current.next = null
            if (current.`val` < x) {
                small.next = current
                small = small.next!!
            } else {
                big.next = current
                big = big.next!!
            }
            current = next
        }

        small.next = bigDummy.next
        return smallDummy.next
    }
}
