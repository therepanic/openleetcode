class Solution {
    func carPooling(_ trips: [[Int]], _ capacity: Int) -> Bool {
        var diff = Array(repeating: 0, count: 1001)
        for trip in trips {
            diff[trip[1]] += trip[0]
            diff[trip[2]] -= trip[0]
        }
        var curr = 0
        for delta in diff {
            curr += delta
            if curr > capacity {
                return false
            }
        }
        return true
    }
}
