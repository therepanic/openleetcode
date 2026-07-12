class Solution {
    func addToArrayForm(_ num: [Int], _ k: Int) -> [Int] {
        var out = [Int]()
        var i = num.count - 1
        var carry = k
        while i >= 0 || carry > 0 {
            if i >= 0 {
                carry += num[i]
                i -= 1
            }
            out.append(carry % 10)
            carry /= 10
        }
        if out.isEmpty {
            return [0]
        }
        return Array(out.reversed())
    }
}
