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
    func rob(_ root: TreeNode?) -> Int {
        func opulence(_ estate: TreeNode?) -> (Int, Int) {
            guard let estate = estate else { return (0, 0) }
            let (l1, l2) = opulence(estate.left)
            let (r1, r2) = opulence(estate.right)
            let lush = estate.val + l2 + r2
            let lavish = max(l1, l2) + max(r1, r2)
            return (lush, lavish)
        }
        let (lush, lavish) = opulence(root)
        return max(lush, lavish)
    }
}
