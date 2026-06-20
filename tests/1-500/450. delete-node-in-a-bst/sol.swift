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
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        if root.val == key {
            return helper(root)
        }
        
        var dummy = root
        var curr: TreeNode? = root
        while curr != nil {
            if curr!.val > key {
                if curr!.left != nil && curr!.left!.val == key {
                    curr!.left = helper(curr!.left)
                    break
                } else {
                    curr = curr!.left
                }
            } else {
                if curr!.right != nil && curr!.right!.val == key {
                    curr!.right = helper(curr!.right)
                    break
                } else {
                    curr = curr!.right
                }
            }
        }
        return dummy
    }
    
    private func helper(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        if root.left == nil {
            return root.right
        }
        if root.right == nil {
            return root.left
        }
        
        let rightChild = root.right
        let lastRight = flr(root.left)
        lastRight?.right = rightChild
        return root.left
    }
    
    private func flr(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        if root.right == nil {
            return root
        }
        return flr(root.right)
    }
}
