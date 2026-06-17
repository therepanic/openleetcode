/**
 * Definition for a binary tree node.
 * class TreeNode(var `val`: Int = 0) {
 *     var left: TreeNode? = null
 *     var right: TreeNode? = null
 * }
 */

class Solution {
    fun lowestCommonAncestor(root: TreeNode?, p: TreeNode?, q: TreeNode?): TreeNode? {
        var current = root
        while (current != null) {
            if (minOf(p!!.`val`, q!!.`val`) > current.`val`) {
                current = current.right
            } else if (maxOf(p.`val`, q.`val`) < current.`val`) {
                current = current.left
            } else {
                return current
            }
        }
        return null
    }
}
