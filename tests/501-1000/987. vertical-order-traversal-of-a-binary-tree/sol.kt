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
    fun verticalTraversal(root: TreeNode?): List<List<Int>> {
        val nodes = mutableListOf<Triple<Int, Int, Int>>()
        
        fun dfs(node: TreeNode?, row: Int, col: Int) {
            if (node == null) return
            nodes.add(Triple(col, row, node.`val`))
            dfs(node.left, row + 1, col - 1)
            dfs(node.right, row + 1, col + 1)
        }
        
        dfs(root, 0, 0)
        nodes.sortWith(compareBy({ it.first }, { it.second }, { it.third }))
        
        val res = mutableListOf<MutableList<Int>>()
        var prevCol: Int? = null
        
        for ((col, _, `val`) in nodes) {
            if (col != prevCol) {
                res.add(mutableListOf())
                prevCol = col
            }
            res.last().add(`val`)
        }
        
        return res
    }
}
