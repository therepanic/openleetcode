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
    func findTilt(_ root: TreeNode?) -> Int {
        ans = 0
        _ = helper(root)
        return ans
    }
    func helper(_ n: TreeNode?) -> Int {
        guard let n = n else { return 0 }
        let l = helper(n.left)
        let r = helper(n.right)
        ans += abs(l - r)
        return l + r + n.val
    }
}
