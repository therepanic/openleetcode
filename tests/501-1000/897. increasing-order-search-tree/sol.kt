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
    fun increasingBST(root: TreeNode?): TreeNode? {
        val vals = mutableListOf<Int>()
        inord(root, vals)
        return create(vals, 0)
    }
    
    private fun create(vals: List<Int>, i: Int): TreeNode? {
        if (i >= vals.size) return null
        val node = TreeNode(vals[i])
        node.right = create(vals, i + 1)
        return node
    }
    
    private fun inord(root: TreeNode?, vals: MutableList<Int>) {
        if (root == null) return
        inord(root.left, vals)
        vals.add(root.`val`)
        inord(root.right, vals)
    }
}
