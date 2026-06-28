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
    func addOneRow(_ root: TreeNode?, _ val: Int, _ depth: Int) -> TreeNode? {
        if depth == 1 {
            let newRoot = TreeNode(val)
            newRoot.left = root
            return newRoot
        }
        
        func construct(_ temp: TreeNode?, _ count: Int) {
            guard let temp = temp else {
                return
            }
            if count == depth - 1 {
                let newLeft = TreeNode(val)
                newLeft.left = temp.left
                temp.left = newLeft
                
                let newRight = TreeNode(val)
                newRight.right = temp.right
                temp.right = newRight
                return
            }
            construct(temp.left, count + 1)
            construct(temp.right, count + 1)
        }
        
        construct(root, 1)
        return root
    }
}
