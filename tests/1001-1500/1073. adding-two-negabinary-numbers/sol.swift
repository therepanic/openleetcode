class Solution {
    func addNegabinary(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
        var res = [Int]()
        var i = arr1.count - 1, j = arr2.count - 1
        var carry = 0
        
        while carry != 0 || i >= 0 || j >= 0 {
            if i >= 0 {
                carry += arr1[i]
                i -= 1
            }
            if j >= 0 {
                carry += arr2[j]
                j -= 1
            }
            res.append(carry & 1)
            carry = -(carry >> 1)
        }
        
        while res.count > 1 && res.last == 0 {
            res.removeLast()
        }
        
        return res.reversed()
    }
}
