
class Solution {
    fun minDepth(root: TreeNode?): Int {
        if (root == null) return 0
        val queue = mutableListOf<TreeNode>()
        val depths = mutableListOf<Int>()
        queue.add(root)
        depths.add(1)
        var head = 0
        while (head < queue.size) {
            val node = queue[head]
            val depth = depths[head]
            head += 1
            if (node.left == null && node.right == null) return depth
            node.left?.let {
                queue.add(it)
                depths.add(depth + 1)
            }
            node.right?.let {
                queue.add(it)
                depths.add(depth + 1)
            }
        }
        return 0
    }
}
