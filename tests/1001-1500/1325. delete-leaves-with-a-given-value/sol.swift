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
    func removeLeafNodes(_ root: TreeNode?, _ target: Int) -> TreeNode? {
        func traverseAndRemove(_ temp: TreeNode?) -> Bool {
            guard let temp = temp else {
                return false
            }
            if temp.left == nil && temp.right == nil {
                return temp.val != target
            }
            let left = traverseAndRemove(temp.left)
            let right = traverseAndRemove(temp.right)
            if !left {
                temp.left = nil
            }
            if !right {
                temp.right = nil
            }
            return left || right || temp.val != target
        }
        
        if !traverseAndRemove(root) {
            return nil
        }
        return root
    }
}
