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
    func balanceBST(_ root: TreeNode?) -> TreeNode? {
        var vals: [Int] = []
        inorder(root, &vals)
        return build(vals, 0, vals.count - 1)
    }
    
    private func inorder(_ node: TreeNode?, _ vals: inout [Int]) {
        guard let node = node else { return }
        inorder(node.left, &vals)
        vals.append(node.val)
        inorder(node.right, &vals)
    }
    
    private func build(_ vals: [Int], _ l: Int, _ r: Int) -> TreeNode? {
        if l > r { return nil }
        let mid = (l + r) / 2
        let node = TreeNode(vals[mid])
        node.left = build(vals, l, mid - 1)
        node.right = build(vals, mid + 1, r)
        return node
    }
}
