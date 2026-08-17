class Solution {
    func nearestValidPoint(_ x: Int, _ y: Int, _ points: [[Int]]) -> Int {
        var currentMinDistance = 20001
        var currentMinIndex = -1
        for (i, point) in points.enumerated() {
            let a = point[0]
            let b = point[1]
            if x == a || y == b {
                let distance = abs(x - a) + abs(y - b)
                if distance < currentMinDistance {
                    currentMinDistance = distance
                    currentMinIndex = i
                }
            }
        }
        return currentMinIndex
    }
}
