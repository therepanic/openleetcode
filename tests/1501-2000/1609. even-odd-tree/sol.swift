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
    func isEvenOddTree(_ root: TreeNode?) -> Bool {
        var elements: [[Int]] = [[]]
        func collect(_ temp: TreeNode?, _ pos: Int) -> Bool {
            guard let temp = temp else { return true }
            if elements.count == pos { elements.append([]) }
            let posCheck = pos % 2
            let valCheck = temp.val % 2
            if posCheck == 0 && valCheck != 0 {
                if !elements[pos].isEmpty && !(elements[pos].last! < temp.val) { return false }
                elements[pos].append(temp.val)
            } else if posCheck != 0 && valCheck == 0 {
                if !elements[pos].isEmpty && !(elements[pos].last! > temp.val) { return false }
                elements[pos].append(temp.val)
            } else {
                return false
            }
            return collect(temp.left, pos + 1) && collect(temp.right, pos + 1)
        }
        return collect(root, 0)
    }
}
