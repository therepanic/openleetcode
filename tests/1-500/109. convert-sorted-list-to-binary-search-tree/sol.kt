
class Solution {
    private lateinit var values: IntArray

    fun sortedListToBST(head: ListNode?): TreeNode? {
        val items = mutableListOf<Int>()
        var current = head
        while (current != null) {
            items.add(current.`val`)
            current = current.next
        }
        values = items.toIntArray()
        return build(0, values.size - 1)
    }

    private fun build(left: Int, right: Int): TreeNode? {
        if (left > right) return null
        val mid = left + (right - left) / 2
        val root = TreeNode(values[mid])
        root.left = build(left, mid - 1)
        root.right = build(mid + 1, right)
        return root
    }
}
