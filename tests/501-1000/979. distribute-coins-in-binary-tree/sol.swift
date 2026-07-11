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
    var moves = 0
    
    func distributeCoins(_ root: TreeNode?) -> Int {
        _ = solve(root)
        return moves
    }
    
    func solve(_ node: TreeNode?) -> Int {
        guard let node = node else { return 0 }
        let leftCandie = solve(node.left)
        let rightCandie = solve(node.right)
        moves += abs(leftCandie) + abs(rightCandie)
        return (leftCandie + rightCandie + node.val) - 1
    }
}
