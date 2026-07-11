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
    fun insertIntoMaxTree(root: TreeNode?, `val`: Int): TreeNode? {
        fun dfs(node: TreeNode?): TreeNode? {
            if (node == null) {
                return TreeNode(`val`)
            }
            if (node.`val` > `val`) {
                node.right = dfs(node.right)
                return node
            }
            val temp = TreeNode(`val`)
            temp.left = node
            return temp
        }
        return dfs(root)
    }
}
