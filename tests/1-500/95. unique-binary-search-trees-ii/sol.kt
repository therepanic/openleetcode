fun generateTrees(n: Int): List<TreeNode?> {
    if (n == 0) return emptyList()
    return buildTrees(1, n)
}

private fun buildTrees(start: Int, end: Int): List<TreeNode?> {
    val trees = mutableListOf<TreeNode?>()
    if (start > end) {
        trees.add(null)
        return trees
    }

    for (rootValue in start..end) {
        val leftTrees = buildTrees(start, rootValue - 1)
        val rightTrees = buildTrees(rootValue + 1, end)
        for (left in leftTrees) {
            for (right in rightTrees) {
                val root = TreeNode(rootValue)
                root.left = left
                root.right = right
                trees.add(root)
            }
        }
    }

    return trees
}
