/**
 * Example:
 * var ti = TreeNode(5)
 * var v = ti.`val`
 * Definition for a binary tree node.
 * class TreeNode(var `val`: Int) {
 *     var left: TreeNode? = null
 *     var right: TreeNode? = null
 * }
 */
class Solution {
    fun widthOfBinaryTree(root: TreeNode?): Int {
        val q: java.util.ArrayDeque<TreeNode?> = java.util.ArrayDeque()
        val ind: java.util.ArrayDeque<Int> = java.util.ArrayDeque()
        val res = mutableListOf<MutableList<Int>>()
        q.offer(root)
        ind.offer(0)
        while (!q.isEmpty()) {
            val l = mutableListOf<Int>()
            val size = q.size
            for (k in 0 until size) {
                val node = q.poll()
                val i = ind.poll()
                if (node != null) {
                    l.add(i)
                    if (node.left != null) {
                        q.offer(node.left)
                        ind.offer(2 * i + 1)
                    }
                    if (node.right != null) {
                        q.offer(node.right)
                        ind.offer(2 * i + 2)
                    }
                }
            }
            res.add(l)
        }
        var maxWidth = 0
        for (r in res) {
            if (r.size >= 1) {
                val width = r.last() - r.first() + 1
                maxWidth = maxOf(maxWidth, width)
            }
        }
        return maxWidth
    }
}
