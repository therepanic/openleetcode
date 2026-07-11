/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func increasingBST(_ root: TreeNode?) -> TreeNode? {
        var vals: [Int] = []
        inord(root, &vals)
        return create(vals, 0)
    }
    
    private func create(_ vals: [Int], _ i: Int) -> TreeNode? {
        if i >= vals.count { return nil }
        let node = TreeNode(vals[i])
        node.right = create(vals, i + 1)
        return node
    }
    
    private func inord(_ root: TreeNode?, _ vals: inout [Int]) {
        guard let root = root else { return }
        inord(root.left, &vals)
        vals.append(root.val)
        inord(root.right, &vals)
    }
}
