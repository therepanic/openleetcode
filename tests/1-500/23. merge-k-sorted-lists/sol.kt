class Solution {
    fun mergeKLists(lists: Array<ListNode?>): ListNode? {
        if (lists.isEmpty()) {
            return null
        }
        return mergeRange(lists, 0, lists.lastIndex)
    }

    private fun mergeRange(lists: Array<ListNode?>, left: Int, right: Int): ListNode? {
        if (left == right) {
            return lists[left]
        }
        val mid = left + (right - left) / 2
        return mergeTwoLists(
            mergeRange(lists, left, mid),
            mergeRange(lists, mid + 1, right)
        )
    }

    private fun mergeTwoLists(list1: ListNode?, list2: ListNode?): ListNode? {
        if (list1 == null || list2 == null) {
            return list1 ?: list2
        }
        if (list1.`val` > list2.`val`) {
            val tmp = list1
            return mergeTwoLists(list2, tmp)
        }
        list1.next = mergeTwoLists(list1.next, list2)
        return list1
    }
}
