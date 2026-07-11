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
    func flipMatchVoyage(_ root: TreeNode?, _ voyage: [Int]) -> [Int] {
        var flippedNodes = [Int]()
        var idx = 0
        
        func dfs(_ node: TreeNode?) -> Bool {
            guard let node = node else { return true }
            guard node.val == voyage[idx] else { return false }
            
            idx += 1
            if let left = node.left, let right = node.right {
                if voyage[idx] == right.val {
                    flippedNodes.append(node.val)
                    guard dfs(node.right) else { return false }
                    guard dfs(node.left) else { return false }
                } else if voyage[idx] == left.val {
                    guard dfs(node.left) else { return false }
                    guard dfs(node.right) else { return false }
                } else {
                    return false
                }
            } else {
                if let left = node.left {
                    guard dfs(left) else { return false }
                } else if let right = node.right {
                    guard dfs(right) else { return false }
                }
            }
            return true
        }
        
        guard dfs(root) else { return [-1] }
        return flippedNodes
    }
}
