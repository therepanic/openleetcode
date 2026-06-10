class Solution {
    func maxPathSum(_ root: TreeNode?) -> Int {
        var best = root!.val

        func dfs(_ node: TreeNode?) -> Int {
            guard let node = node else {
                return 0
            }
            let left = Swift.max(dfs(node.left), 0)
            let right = Swift.max(dfs(node.right), 0)
            best = Swift.max(best, node.val + left + right)
            return node.val + Swift.max(left, right)
        }

        _ = dfs(root)
        return best
    }
}
