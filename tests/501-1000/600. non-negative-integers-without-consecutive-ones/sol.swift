class Solution {
    func findIntegers(_ n: Int) -> Int {
        var f = [Int](repeating: 0, count: 30)
        f[0] = 1
        f[1] = 2
        for i in 2..<30 {
            f[i] = f[i - 1] + f[i - 2]
        }
        
        var ans = 0
        var last_seen = 0
        for i in stride(from: 29, through: 0, by: -1) {
            if (1 << i) & n != 0 {
                ans += f[i]
                if last_seen == 1 {
                    ans -= 1
                    break
                }
                last_seen = 1
            } else {
                last_seen = 0
            }
        }
        return ans + 1
    }
}
