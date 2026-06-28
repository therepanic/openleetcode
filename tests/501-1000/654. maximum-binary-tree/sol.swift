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
    func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
        var stack: [TreeNode] = []
        
        for num in nums {
            let current = TreeNode(num)
            
            while !stack.isEmpty && stack.last!.val < num {
                current.left = stack.removeLast()
            }
            
            if !stack.isEmpty {
                stack.last!.right = current
            }
            
            stack.append(current)
        }
        
        return stack[0]
    }
}
