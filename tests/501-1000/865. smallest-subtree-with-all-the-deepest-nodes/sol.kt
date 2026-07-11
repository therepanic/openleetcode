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
    fun subtreeWithAllDeepest(root: TreeNode?): TreeNode? {
        if (root == null) return null
        
        val parent = mutableMapOf<TreeNode, TreeNode?>()
        parent[root] = null
        val q = ArrayDeque<TreeNode>()
        q.add(root)
        var lastLevel = mutableListOf<TreeNode>()
        
        while (q.isNotEmpty()) {
            val size = q.size
            lastLevel = mutableListOf()
            repeat(size) {
                val node = q.removeFirst()
                lastLevel.add(node)
                node.left?.let {
                    parent[it] = node
                    q.add(it)
                }
                node.right?.let {
                    parent[it] = node
                    q.add(it)
                }
            }
        }
        
        var deepest = lastLevel.toMutableSet()
        while (deepest.size > 1) {
            deepest = deepest.map { parent[it]!! }.toMutableSet()
        }
        
        return deepest.first()
    }
}
