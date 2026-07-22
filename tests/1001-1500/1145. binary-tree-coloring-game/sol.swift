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
    func subtreeCount(_ node: TreeNode?) -> Int {
        guard let node = node else { return 0 }
        let leftCount = subtreeCount(node.left)
        let rightCount = subtreeCount(node.right)
        return leftCount + rightCount + 1
    }

    func btreeGameWinningMove(_ root: TreeNode?, _ n: Int, _ x: Int) -> Bool {
        var queue = [root]
        var node: TreeNode? = nil
        while !queue.isEmpty {
            guard let front = queue.removeFirst() else { continue }
            if front.val == x {
                node = front
                break
            }
            if let left = front.left { queue.append(left) }
            if let right = front.right { queue.append(right) }
        }

        let leftCount = subtreeCount(node!.left)
        let rightCount = subtreeCount(node!.right)
        let parentCount = n - leftCount - rightCount - 1
        if parentCount > leftCount + rightCount {
            return true
        } else if leftCount > parentCount + rightCount {
            return true
        } else if rightCount > parentCount + leftCount {
            return true
        }
        return false
    }
}
