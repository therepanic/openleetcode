class Solution {
    func intersectionSizeTwo(_ intervals: [[Int]]) -> Int {
        let sorted = intervals.sorted { 
            if $0[1] != $1[1] { return $0[1] < $1[1] }
            return $0[0] > $1[0] 
        }
        var ans = 0
        var a = -1, b = -1
        for interval in sorted {
            let l = interval[0], r = interval[1]
            if l > b {
                a = r - 1
                b = r
                ans += 2
            } else if l > a {
                a = b
                b = r
                ans += 1
            }
        }
        return ans
    }
}
