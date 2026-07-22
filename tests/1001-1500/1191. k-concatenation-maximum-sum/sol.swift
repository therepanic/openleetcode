class Solution {
    func kConcatenationMaxSum(_ arr: [Int], _ k: Int) -> Int {
        let MOD = 1000000007
        
        func kadanes(_ nums: [Int]) -> Int {
            var best = 0
            var total = 0
            for x in nums {
                total += x
                if total < 0 { total = 0 }
                best = max(best, total)
            }
            return best
        }
        
        if k <= 3 {
            var extended: [Int] = []
            for _ in 0..<k {
                extended.append(contentsOf: arr)
            }
            return kadanes(extended) % MOD
        }
        
        let sum = arr.reduce(0, +)
        let s = max(0, sum * (k - 1)) % MOD
        
        let doubleArr = arr + arr
        
        return max(s + kadanes(arr), kadanes(doubleArr)) % MOD
    }
}
