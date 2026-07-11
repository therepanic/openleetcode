class Solution {
    func bstToGst(_ root: TreeNode?) -> TreeNode? {
        var sum = 0

        func traverse(_ node: TreeNode?) {
            guard let node = node else { return }
            traverse(node.right)
            sum += node.val
            node.val = sum
            traverse(node.left)
        }

        traverse(root)
        return root
    }
}
