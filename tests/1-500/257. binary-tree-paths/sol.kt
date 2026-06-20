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
    fun binaryTreePaths(root: TreeNode?): List<String> {
        val res = mutableListOf<String>()
        if (root == null) {
            return res
        }
        val stack = ArrayDeque<Pair<TreeNode, String>>()
        stack.addLast(Pair(root, root.`val`.toString()))
        while (stack.isNotEmpty()) {
            val (node, path) = stack.removeLast()
            if (node.left == null && node.right == null) {
                res.add(path)
            }
            node.right?.let {
                stack.addLast(Pair(it, "$path->${it.`val`}"))
            }
            node.left?.let {
                stack.addLast(Pair(it, "$path->${it.`val`}"))
            }
        }
        return res
    }
}
