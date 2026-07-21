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
    func getAllElements(_ root1: TreeNode?, _ root2: TreeNode?) -> [Int] {
        var stack1: [TreeNode] = []
        var stack2: [TreeNode] = []
        var output: [Int] = []
        var r1 = root1
        var r2 = root2
        
        while r1 != nil || r2 != nil || !stack1.isEmpty || !stack2.isEmpty {
            while let node = r1 {
                stack1.append(node)
                r1 = node.left
            }
            while let node = r2 {
                stack2.append(node)
                r2 = node.left
            }

            if !stack1.isEmpty && !stack2.isEmpty {
                if stack1.last!.val <= stack2.last!.val {
                    r1 = stack1.removeLast()
                    output.append(r1!.val)
                    r1 = r1!.right
                } else {
                    r2 = stack2.removeLast()
                    output.append(r2!.val)
                    r2 = r2!.right
                }
            } else if stack1.isEmpty {
                r2 = stack2.removeLast()
                output.append(r2!.val)
                r2 = r2!.right
            } else {
                r1 = stack1.removeLast()
                output.append(r1!.val)
                r1 = r1!.right
            }
        }
        
        return output
    }
}
