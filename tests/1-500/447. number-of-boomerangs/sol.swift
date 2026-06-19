class Solution {
    func numberOfBoomerangs(_ points: [[Int]]) -> Int {
        var result = 0
        for p in points {
            var distances = [Int: Int]()
            for q in points {
                let d = (p[0] - q[0]) * (p[0] - q[0]) + (p[1] - q[1]) * (p[1] - q[1])
                distances[d, default: 0] += 1
            }
            for count in distances.values {
                result += count * (count - 1)
            }
        }
        return result
    }
}
