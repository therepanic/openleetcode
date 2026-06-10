
class Solution {
    fun levelOrder(root: TreeNode?): List<List<Int>> {
        if (root == null) return emptyList()
        val result = mutableListOf<List<Int>>()
        val queue = mutableListOf(root)
        var head = 0
        while (head < queue.size) {
            val size = queue.size - head
            val level = mutableListOf<Int>()
            repeat(size) {
                val node = queue[head++]
                level.add(node.`val`)
                node.left?.let { queue.add(it) }
                node.right?.let { queue.add(it) }
            }
            result.add(level)
        }
        return result
    }
}
