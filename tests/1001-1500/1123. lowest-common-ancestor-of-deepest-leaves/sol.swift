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
    func lcaDeepestLeaves(_ root: TreeNode?) -> TreeNode? {
        func dfs(_ node: TreeNode?, _ depth: Int) -> (TreeNode?, Int) {
            guard let node = node else {
                return (nil, depth)
            }
            
            let left = dfs(node.left, depth + 1)
            let right = dfs(node.right, depth + 1)
            
            if left.1 > right.1 {
                return (left.0, left.1)
            } else if right.1 > left.1 {
                return (right.0, right.1)
            } else {
                return (node, left.1)
            }
        }
        
        return dfs(root, 0).0
    }
}
