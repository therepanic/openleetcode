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
    var prev: Int?
    var minDiff = Int.max
    
    func minDiffInBST(_ root: TreeNode?) -> Int {
        inorder(root)
        return minDiff
    }
    
    func inorder(_ root: TreeNode?) {
        guard let root = root else { return }
        inorder(root.left)
        if let prev = prev {
            let diff = root.val - prev
            if diff < minDiff {
                minDiff = diff
            }
        }
        prev = root.val
        inorder(root.right)
    }
}
