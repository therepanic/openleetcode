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
    private fun subtreeCount(node: TreeNode?): Int {
        if (node == null) return 0
        val leftCount = subtreeCount(node.left)
        val rightCount = subtreeCount(node.right)
        return leftCount + rightCount + 1
    }

    fun btreeGameWinningMove(root: TreeNode?, n: Int, x: Int): Boolean {
        val queue = java.util.LinkedList<TreeNode?>()
        queue.offer(root)
        var node: TreeNode? = null
        while (queue.isNotEmpty()) {
            val front = queue.poll()
            if (front!!.`val` == x) {
                node = front
                break
            }
            if (front.left != null) queue.offer(front.left)
            if (front.right != null) queue.offer(front.right)
        }

        val leftCount = subtreeCount(node!!.left)
        val rightCount = subtreeCount(node.right)
        val parentCount = n - leftCount - rightCount - 1
        if (parentCount > leftCount + rightCount) return true
        else if (leftCount > parentCount + rightCount) return true
        else if (rightCount > parentCount + leftCount) return true
        return false
    }
}
