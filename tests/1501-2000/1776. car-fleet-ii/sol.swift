class Solution {
    func getCollisionTimes(_ cars: [[Int]]) -> [Double] {
        let n = cars.count
        var rightGreater = [Int](repeating: -1, count: n)
        var ans = [Double](repeating: -1.0, count: n)
        var stack: [Int] = []
        for r in stride(from: n - 1, through: 0, by: -1) {
            while !stack.isEmpty && cars[stack.last!][1] >= cars[r][1] {
                stack.removeLast()
            }
            if !stack.isEmpty {
                rightGreater[r] = stack.last!
            }
            stack.append(r)
        }
        for r in stride(from: n - 1, through: 0, by: -1) {
            var collideId = rightGreater[r]
            while collideId != -1 && ans[collideId] != -1 && ans[collideId] < Double(cars[collideId][0] - cars[r][0]) / Double(cars[r][1] - cars[collideId][1]) {
                collideId = rightGreater[collideId]
            }
            if collideId != -1 {
                ans[r] = Double(cars[collideId][0] - cars[r][0]) / Double(cars[r][1] - cars[collideId][1])
            }
        }
        return ans
    }
}
