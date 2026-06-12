
class Solution {
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var result = [[Int]]()
        var queue = [root]
        var head = 0
        var leftToRight = true
        while head < queue.count {
            let size = queue.count - head
            var level = Array(repeating: 0, count: size)
            for i in 0..<size {
                let node = queue[head]
                head += 1
                let index = leftToRight ? i : size - 1 - i
                level[index] = node.val
                if let left = node.left { queue.append(left) }
                if let right = node.right { queue.append(right) }
            }
            result.append(level)
            leftToRight.toggle()
        }
        return result
    }
}
