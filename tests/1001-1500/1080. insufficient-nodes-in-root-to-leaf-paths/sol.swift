class Solution {
    func sufficientSubset(_ root: TreeNode?, _ limit: Int) -> TreeNode? {
        func retain(_ node: TreeNode?, _ sum: Int) -> Bool {
            guard let node = node else { return false }
            let current = sum + node.val

            if node.left == nil && node.right == nil {
                return current >= limit
            }

            let keepLeft = retain(node.left, current)
            let keepRight = retain(node.right, current)
            if !keepLeft { node.left = nil }
            if !keepRight { node.right = nil }
            return keepLeft || keepRight
        }

        return retain(root, 0) ? root : nil
    }
}
