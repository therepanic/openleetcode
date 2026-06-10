
class Solution {
    fun levelOrderBottom(root: TreeNode?): List<List<Int>> {
        if (root == null) return emptyList()
        val levels = mutableListOf<List<Int>>()
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
            levels.add(level)
        }
        levels.reverse()
        return levels
    }
}
