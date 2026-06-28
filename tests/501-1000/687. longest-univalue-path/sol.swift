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
    var ans = 0
    
    private func solve(_ node: TreeNode?) -> Int {
        guard let node = node else { return 0 }
        let left = solve(node.left)
        let right = solve(node.right)
        var leftPath = 0
        var rightPath = 0
        if let leftNode = node.left, leftNode.val == node.val {
            leftPath = left + 1
        }
        if let rightNode = node.right, rightNode.val == node.val {
            rightPath = right + 1
        }
        ans = max(ans, leftPath + rightPath)
        return max(leftPath, rightPath)
    }
    
    func longestUnivaluePath(_ root: TreeNode?) -> Int {
        ans = 0
        solve(root)
        return ans
    }
}
