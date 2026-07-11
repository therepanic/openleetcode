class Solution {
    func delNodes(_ root: TreeNode?, _ to_delete: [Int]) -> [TreeNode?] {
        let deleted = Set(to_delete)
        var forest: [TreeNode?] = []

        func prune(_ node: TreeNode?, _ isRoot: Bool) -> TreeNode? {
            guard let node = node else { return nil }
            let remove = deleted.contains(node.val)

            if isRoot && !remove {
                forest.append(node)
            }

            node.left = prune(node.left, remove)
            node.right = prune(node.right, remove)
            return remove ? nil : node
        }

        _ = prune(root, true)
        return forest
    }
}
