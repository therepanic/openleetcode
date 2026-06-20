class Solution {
    private var best = 0

    fun maxPathSum(root: TreeNode?): Int {
        best = root!!.`val`
        dfs(root)
        return best
    }

    private fun dfs(node: TreeNode?): Int {
        if (node == null) {
            return 0
        }
        val left = maxOf(dfs(node.left), 0)
        val right = maxOf(dfs(node.right), 0)
        best = maxOf(best, node.`val` + left + right)
        return node.`val` + maxOf(left, right)
    }
}
