class Solution {
    func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        return arr.sorted { a, b in
            let da = abs(a - x)
            let db = abs(b - x)
            if da != db { return da < db }
            return a < b
        }
        .prefix(k)
        .sorted()
    }
}
