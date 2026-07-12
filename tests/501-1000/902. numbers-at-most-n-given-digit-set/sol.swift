class Solution {
    func atMostNGivenDigitSet(_ digits: [String], _ n: Int) -> Int {
        let d = digits.count
        let s = String(n)
        let k = s.count
        
        var ans: Int
        if d == 1 {
            ans = k - 1
        } else {
            ans = (Int(pow(Double(d), Double(k))) - d) / (d - 1)
        }
        
        for (i, ch) in s.enumerated() {
            let cnt = digits.filter { $0 < String(ch) }.count
            ans += cnt * Int(pow(Double(d), Double(k - i - 1)))
            
            if !digits.contains(String(ch)) {
                break
            }
            if i == k - 1 {
                ans += 1
            }
        }
        
        return ans
    }
}
