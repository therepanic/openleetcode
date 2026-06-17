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
    func countNodes(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        let leftDepth = getDepth(root.left)
        let rightDepth = getDepth(root.right)
        
        if leftDepth == rightDepth {
            return (1 << leftDepth) + countNodes(root.right)
        } else {
            return (1 << rightDepth) + countNodes(root.left)
        }
    }
    
    private func getDepth(_ node: TreeNode?) -> Int {
        var depth = 0
        var current = node
        while current != nil {
            depth += 1
            current = current?.left
        }
        return depth
    }
}
