class Solution {
    fun rightSideView(root: TreeNode?): List<Int> {
        val result = ArrayList<Int>()
        fun dfs(node: TreeNode?, depth: Int) {
            if (node == null) {
                return
            }
            if (depth == result.size) {
                result.add(node.`val`)
            } else {
                result[depth] = node.`val`
            }
            dfs(node.left, depth + 1)
            dfs(node.right, depth + 1)
        }
        dfs(root, 0)
        return result
    }
}
