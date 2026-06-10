class Solution {
    func sumNumbers(_ root: TreeNode?) -> Int {
        func dfs(_ node: TreeNode?, _ current: Int) -> Int {
            guard let node = node else { return 0 }
            let next = current * 10 + node.val
            if node.left == nil && node.right == nil { return next }
            return dfs(node.left, next) + dfs(node.right, next)
        }
        return dfs(root, 0)
    }
}
