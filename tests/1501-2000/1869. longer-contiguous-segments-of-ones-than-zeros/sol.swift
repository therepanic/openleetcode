class Solution {
    func checkZeroOnes(_ s: String) -> Bool {
        var max1 = 0
        var max0 = 0
        var one = 0
        var zero = 0
        
        for ch in s {
            if ch == "1" {
                one += 1
                zero = 0
                max1 = max(max1, one)
            } else {
                zero += 1
                one = 0
                max0 = max(max0, zero)
            }
        }
        
        return max1 > max0
    }
}
