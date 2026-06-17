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
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        func inorderTraversal(_ node: TreeNode?) -> [Int] {
            guard let node = node else { return [] }
            return inorderTraversal(node.left) + [node.val] + inorderTraversal(node.right)
        }
        
        let sortedElements = inorderTraversal(root)
        return sortedElements[k - 1]
    }
}
