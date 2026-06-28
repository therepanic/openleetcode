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
    fun searchBST(root: TreeNode?, `val`: Int): TreeNode? {
        if (root == null || root.`val` == `val`) {
            return root
        }
        if (`val` < root.`val`) {
            return searchBST(root.left, `val`)
        }
        return searchBST(root.right, `val`)
    }
}
