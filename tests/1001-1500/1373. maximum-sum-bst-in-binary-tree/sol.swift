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
    private var best = 0
    
    func maxSumBST(_ root: TreeNode?) -> Int {
        best = 0
        let _ = dfs(root)
        return best
    }
    
    private func dfs(_ node: TreeNode?) -> (Bool, Int, Int, Int) {
        guard let node = node else {
            return (true, Int.max, Int.min, 0)
        }
        
        let (lbst, lmin, lmax, lsum) = dfs(node.left)
        let (rbst, rmin, rmax, rsum) = dfs(node.right)
        
        if lbst && rbst && lmax < node.val && node.val < rmin {
            let total = lsum + rsum + node.val
            best = max(best, total)
            let newMin = min(lmin, node.val)
            let newMax = max(rmax, node.val)
            return (true, newMin, newMax, total)
        }
        
        return (false, Int.min, Int.max, 0)
    }
}
