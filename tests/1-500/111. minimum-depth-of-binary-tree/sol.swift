
class Solution {
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var queue: [(TreeNode, Int)] = [(root, 1)]
        var head = 0
        while head < queue.count {
            let (node, depth) = queue[head]
            head += 1
            if node.left == nil && node.right == nil { return depth }
            if let left = node.left { queue.append((left, depth + 1)) }
            if let right = node.right { queue.append((right, depth + 1)) }
        }
        return 0
    }
}
