class Solution {
    func largestPalindrome(_ n: Int) -> Int {
        if n == 1 {
            return 9
        }
        
        let minNum = Int(pow(10.0, Double(n - 1)))
        let maxNum = Int(pow(10.0, Double(n))) - 1
        var maxPal = 0
        
        var i = maxNum
        while i >= minNum {
            if i * i < maxPal {
                break
            }
            
            var j = maxNum
            while j >= i {
                let product = i * j
                
                if product % 11 != 0 && product >= maxPal {
                    j -= 2
                    continue
                }
                
                let str = String(product)
                if str == String(str.reversed()) {
                    maxPal = product
                }
                
                j -= 2
            }
            
            i -= 2
        }
        
        return maxPal % 1337
    }
}
