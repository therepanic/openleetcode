
class Solution {
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var levels = [[Int]]()
        var queue = [root]
        var head = 0
        while head < queue.count {
            let size = queue.count - head
            var level = [Int]()
            for _ in 0..<size {
                let node = queue[head]
                head += 1
                level.append(node.val)
                if let left = node.left { queue.append(left) }
                if let right = node.right { queue.append(right) }
            }
            levels.append(level)
        }
        return levels.reversed()
    }
}
