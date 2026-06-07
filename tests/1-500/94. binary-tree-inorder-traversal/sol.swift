class Solution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()

        func traverse(_ node: TreeNode?) {
            guard let node = node else {
                return
            }
            traverse(node.left)
            result.append(node.val)
            traverse(node.right)
        }

        traverse(root)
        return result
    }
}
