class Solution {
    func validateBinaryTreeNodes(_ n: Int, _ leftChild: [Int], _ rightChild: [Int]) -> Bool {
        var inDegree = [Int](repeating: 0, count: n)
        for i in 0..<n {
            for child in [leftChild[i], rightChild[i]] {
                if child != -1 {
                    if child < 0 || child >= n { return false }
                    inDegree[child] += 1
                    if inDegree[child] > 1 { return false }
                }
            }
        }

        var root = -1
        for i in 0..<n {
            if inDegree[i] == 0 {
                if root != -1 { return false }
                root = i
            }
        }
        if root == -1 { return false }

        var queue = [root]
        var visited = [Bool](repeating: false, count: n)
        visited[root] = true
        var count = 1

        while !queue.isEmpty {
            let node = queue.removeFirst()
            for child in [leftChild[node], rightChild[node]] {
                if child == -1 { continue }
                if visited[child] { return false }
                visited[child] = true
                count += 1
                queue.append(child)
            }
        }
        return count == n
    }
}
