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
    func bstFromPreorder(_ preorder: [Int]) -> TreeNode? {
        if preorder.isEmpty {
            return nil
        }
        return build(preorder, 0, preorder.count - 1)
    }
    
    private func build(_ preorder: [Int], _ start: Int, _ end: Int) -> TreeNode? {
        if start > end {
            return nil
        }
        let root = TreeNode(preorder[start])
        var i = start + 1
        while i <= end && preorder[i] < root.val {
            i += 1
        }
        root.left = build(preorder, start + 1, i - 1)
        root.right = build(preorder, i, end)
        return root
    }
}
