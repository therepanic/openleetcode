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
    func isCompleteTree(_ root: TreeNode?) -> Bool {
        var q: [TreeNode?] = [root]
        var past = false
        while !q.isEmpty {
            let node = q.removeFirst()
            if node == nil {
                past = true
            } else {
                if past { return false }
                q.append(node!.left)
                q.append(node!.right)
            }
        }
        return true
    }
}
