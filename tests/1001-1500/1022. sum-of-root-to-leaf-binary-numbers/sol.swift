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
    func sumRootToLeaf(_ root: TreeNode?) -> Int {
        func dfs(_ node: TreeNode?, _ current: Int) -> Int {
            guard let node = node else {
                return 0
            }
            
            let newCurrent = current * 2 + node.val
            
            if node.left == nil && node.right == nil {
                return newCurrent
            }
            
            return dfs(node.left, newCurrent) + dfs(node.right, newCurrent)
        }
        
        return dfs(root, 0)
    }
}
