class Solution {
    func canMeasureWater(_ x: Int, _ y: Int, _ target: Int) -> Bool {
        if target > x + y {
            return false
        }
        var stack = [[0, 0]]
        var visited = Set<String>()
        while !stack.isEmpty {
            let state = stack.removeLast()
            let a = state[0], b = state[1]
            if a + b == target {
                return true
            }
            let key = "\(a),\(b)"
            if visited.contains(key) {
                continue
            }
            visited.insert(key)
            stack.append([x, b])
            stack.append([a, y])
            stack.append([0, b])
            stack.append([a, 0])
            let w = min(a, y - b)
            stack.append([a - w, b + w])
            let w2 = min(b, x - a)
            stack.append([a + w2, b - w2])
        }
        return false
    }
}
