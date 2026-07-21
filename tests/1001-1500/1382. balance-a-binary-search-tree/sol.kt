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
    fun balanceBST(root: TreeNode?): TreeNode? {
        val vals = mutableListOf<Int>()
        inorder(root, vals)
        return build(vals, 0, vals.size - 1)
    }
    
    private fun inorder(node: TreeNode?, vals: MutableList<Int>) {
        if (node == null) return
        inorder(node.left, vals)
        vals.add(node.`val`)
        inorder(node.right, vals)
    }
    
    private fun build(vals: List<Int>, l: Int, r: Int): TreeNode? {
        if (l > r) return null
        val mid = (l + r) / 2
        val node = TreeNode(vals[mid])
        node.left = build(vals, l, mid - 1)
        node.right = build(vals, mid + 1, r)
        return node
    }
}
