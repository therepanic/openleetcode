class Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {
        func validate(_ node: TreeNode?, _ lower: Int?, _ upper: Int?) -> Bool {
            guard let node = node else {
                return true
            }
            if let lower = lower, node.val <= lower {
                return false
            }
            if let upper = upper, node.val >= upper {
                return false
            }
            return validate(node.left, lower, node.val) &&
                validate(node.right, node.val, upper)
        }

        return validate(root, nil, nil)
    }
}
