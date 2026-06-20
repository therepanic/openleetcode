
class Solution {
    private val result = mutableListOf<List<Int>>()
    private val path = mutableListOf<Int>()

    fun pathSum(root: TreeNode?, targetSum: Int): List<List<Int>> {
        result.clear()
        path.clear()
        dfs(root, targetSum)
        return result
    }

    private fun dfs(node: TreeNode?, remaining: Int) {
        if (node == null) return
        path.add(node.`val`)
        val next = remaining - node.`val`
        if (node.left == null && node.right == null && next == 0) {
            result.add(path.toList())
        } else {
            dfs(node.left, next)
            dfs(node.right, next)
        }
        path.removeAt(path.size - 1)
    }
}
