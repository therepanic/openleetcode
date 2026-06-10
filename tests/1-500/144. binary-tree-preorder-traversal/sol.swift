class Solution {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        guard let root = root else { return result }

        var stack = [root]
        while let node = stack.popLast() {
            result.append(node.val)
            if let right = node.right { stack.append(right) }
            if let left = node.left { stack.append(left) }
        }
        return result
    }
}
