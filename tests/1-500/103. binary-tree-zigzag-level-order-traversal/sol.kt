
class Solution {
    fun zigzagLevelOrder(root: TreeNode?): List<List<Int>> {
        if (root == null) return emptyList()
        val result = mutableListOf<List<Int>>()
        val queue = mutableListOf(root)
        var head = 0
        var leftToRight = true
        while (head < queue.size) {
            val size = queue.size - head
            val level = MutableList(size) { 0 }
            for (i in 0 until size) {
                val node = queue[head++]
                val index = if (leftToRight) i else size - 1 - i
                level[index] = node.`val`
                node.left?.let { queue.add(it) }
                node.right?.let { queue.add(it) }
            }
            result.add(level)
            leftToRight = !leftToRight
        }
        return result
    }
}
