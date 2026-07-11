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
    fun recoverFromPreorder(traversal: String): TreeNode? {
        val stack = mutableListOf<TreeNode>()
        var root: TreeNode? = null
        var i = 0
        while (i < traversal.length) {
            var depth = 0
            while (i < traversal.length && traversal[i] == '-') {
                depth++
                i++
            }
            var num = 0
            while (i < traversal.length && traversal[i].isDigit()) {
                num = num * 10 + (traversal[i] - '0')
                i++
            }
            val node = TreeNode(num)
            while (stack.size > depth) {
                stack.removeAt(stack.lastIndex)
            }
            if (stack.isEmpty()) {
                root = node
            } else {
                val parent = stack.last()
                if (parent.left == null) {
                    parent.left = node
                } else {
                    parent.right = node
                }
            }
            stack.add(node)
        }
        return root
    }
}
