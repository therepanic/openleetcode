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
    func smallestFromLeaf(_ root: TreeNode?) -> String {
        var smallestString = ""
        var nodeQueue: [(TreeNode, String)] = []
        
        nodeQueue.append((root!, String(Character(UnicodeScalar(root!.val + 97)!))))
        
        while !nodeQueue.isEmpty {
            let (node, currentString) = nodeQueue.removeFirst()
            
            if node.left == nil && node.right == nil {
                if smallestString.isEmpty || currentString < smallestString {
                    smallestString = currentString
                }
            }
            
            if let leftNode = node.left {
                nodeQueue.append((leftNode, String(Character(UnicodeScalar(leftNode.val + 97)!)) + currentString))
            }
            
            if let rightNode = node.right {
                nodeQueue.append((rightNode, String(Character(UnicodeScalar(rightNode.val + 97)!)) + currentString))
            }
        }
        
        return smallestString
    }
}
