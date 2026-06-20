
class Solution {
    fun maxDepth(root: TreeNode?): Int {
        if (root == null) return 0
        val queue = mutableListOf(root)
        var head = 0
        var depth = 0
        while (head < queue.size) {
            val size = queue.size - head
            repeat(size) {
                val node = queue[head++]
                node.left?.let { queue.add(it) }
                node.right?.let { queue.add(it) }
            }
            depth++
        }
        return depth
    }
}
