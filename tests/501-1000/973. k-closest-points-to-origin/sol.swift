class Solution {
    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        return points.sorted { a, b in
            let da = a[0] * a[0] + a[1] * a[1]
            let db = b[0] * b[0] + b[1] * b[1]
            return da < db
        }.prefix(k).map { $0 }
    }
}
