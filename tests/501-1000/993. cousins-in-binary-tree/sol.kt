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
    fun isCousins(root: TreeNode?, x: Int, y: Int): Boolean {
        val res = mutableListOf<Pair<Int?, Int>>()
        val stack = ArrayDeque<Triple<TreeNode?, TreeNode?, Int>>()
        stack.addLast(Triple(root, null, 0))
        while (stack.isNotEmpty()) {
            val (curr, parent, depth) = stack.removeLast()
            if (curr!!.`val` == x || curr.`val` == y) {
                res.add(Pair(parent?.`val`, depth))
            }
            if (curr.left != null) {
                stack.addLast(Triple(curr.left, curr, depth + 1))
            }
            if (curr.right != null) {
                stack.addLast(Triple(curr.right, curr, depth + 1))
            }
        }
        return res.size == 2 && res[0].second == res[1].second && res[0].first != res[1].first
    }
}
