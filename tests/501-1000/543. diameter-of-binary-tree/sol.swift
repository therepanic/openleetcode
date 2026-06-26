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
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        func height(_ node: TreeNode?) -> Int {
            guard let node = node else { return 0 }
            return 1 + max(height(node.left), height(node.right))
        }
        
        func diameter(_ node: TreeNode?) -> Int {
            guard let node = node else { return 0 }
            let diameterThroughNode = height(node.left) + height(node.right)
            let leftDiameter = diameter(node.left)
            let rightDiameter = diameter(node.right)
            return max(diameterThroughNode, max(leftDiameter, rightDiameter))
        }
        
        return diameter(root)
    }
}
