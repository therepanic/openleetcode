class Solution {
    fun sumNumbers(root: TreeNode?): Long {
        return dfs(root, 0)
    }

    private fun dfs(node: TreeNode?, current: Long): Long {
        if (node == null) return 0L
        val next = current * 10L + node.`val`
        if (node.left == null && node.right == null) return next
        return dfs(node.left, next) + dfs(node.right, next)
    }
}
