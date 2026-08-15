class Solution {
    func minimumBoxes(_ n: Int) -> Int {
        var x = Int(pow(Double(6*n), 1.0/3.0))
        if x*(x+1)*(x+2) > 6*n {
            x -= 1
        }
        
        var ans = x*(x+1)/2
        var remaining = n - x*(x+1)*(x+2)/6
        var k = 1
        while remaining > 0 {
            ans += 1
            remaining -= k
            k += 1
        }
        return ans
    }
}
