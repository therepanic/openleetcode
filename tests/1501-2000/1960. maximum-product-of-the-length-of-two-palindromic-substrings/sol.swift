class Solution {
    func maxProduct(_ s: String) -> Int {
        let chars = Array(s)
        let n = chars.count
        
        // Manacher (odd length only)
        var d = [Int](repeating: 0, count: n)
        var l = 0
        var r = -1
        
        for i in 0..<n {
            var k: Int
            if i > r {
                k = 1
            } else {
                k = min(d[l + r - i], r - i + 1)
            }
            
            while i - k >= 0 && i + k < n && chars[i - k] == chars[i + k] {
                k += 1
            }
            
            d[i] = k
            
            if i + k - 1 > r {
                l = i - k + 1
                r = i + k - 1
            }
        }
        
        // left[i] = max palindrome ending at i
        var left = [Int](repeating: 0, count: n)
        
        for i in 0..<n {
            let radius = d[i]
            let length = 2 * radius - 1
            let end = i + radius - 1
            left[end] = max(left[end], length)
        }
        
        // propagate backwards (reduce by 2)
        for i in stride(from: n - 2, through: 0, by: -1) {
            left[i] = max(left[i], left[i + 1] - 2)
        }
        
        // prefix max
        for i in 1..<n {
            left[i] = max(left[i], left[i - 1])
        }
        
        
        // right[i] = max palindrome starting at i
        var right = [Int](repeating: 0, count: n)
        
        for i in 0..<n {
            let radius = d[i]
            let length = 2 * radius - 1
            let start = i - radius + 1
            right[start] = max(right[start], length)
        }
        
        // propagate forward (reduce by 2)
        for i in 1..<n {
            right[i] = max(right[i], right[i - 1] - 2)
        }
        
        // suffix max
        for i in stride(from: n - 2, through: 0, by: -1) {
            right[i] = max(right[i], right[i + 1])
        }
        
        
        // try all splits
        var ans = 0
        for i in 0..<(n - 1) {
            ans = max(ans, left[i] * right[i + 1])
        }
        
        return ans
    }
}
