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
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        var seen = Set<Int>()
        
        func dfs(_ node: TreeNode?) -> Bool {
            guard let node = node else { return false }
            if seen.contains(k - node.val) { return true }
            seen.insert(node.val)
            return dfs(node.left) || dfs(node.right)
        }
        
        return dfs(root)
    }
}
