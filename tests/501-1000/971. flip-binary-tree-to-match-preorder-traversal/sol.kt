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
    private val flippedNodes = mutableListOf<Int>()
    private var idx = 0
    private lateinit var voyage: IntArray
    
    fun flipMatchVoyage(root: TreeNode?, voyage: IntArray): List<Int> {
        flippedNodes.clear()
        idx = 0
        this.voyage = voyage
        
        if (!dfs(root)) return listOf(-1)
        return flippedNodes
    }
    
    private fun dfs(node: TreeNode?): Boolean {
        if (node == null) return true
        if (node.`val` != voyage[idx]) return false
        
        idx++
        if (node.left != null && node.right != null) {
            if (voyage[idx] == node.right!!.`val`) {
                flippedNodes.add(node.`val`)
                if (!dfs(node.right)) return false
                if (!dfs(node.left)) return false
            } else if (voyage[idx] == node.left!!.`val`) {
                if (!dfs(node.left)) return false
                if (!dfs(node.right)) return false
            } else {
                return false
            }
        } else {
            if (node.left != null) {
                if (!dfs(node.left)) return false
            } else if (node.right != null) {
                if (!dfs(node.right)) return false
            }
        }
        return true
    }
}
