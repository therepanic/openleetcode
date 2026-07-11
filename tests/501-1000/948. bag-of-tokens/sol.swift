class Solution {
    func bagOfTokensScore(_ tokens: [Int], _ power: Int) -> Int {
        var tokens = tokens.sorted()
        let n = tokens.count
        var l = 0
        var curr = 0
        var power = power
        
        while l < n && tokens[l] <= power {
            power -= tokens[l]
            l += 1
            curr += 1
        }
        
        var r = n - 1
        var res = curr
        
        while l < r && curr > 0 {
            power += tokens[r]
            curr -= 1
            r -= 1
            
            while l <= r && tokens[l] <= power {
                power -= tokens[l]
                l += 1
                curr += 1
            }
            res = max(res, curr)
        }
        
        return res
    }
}
