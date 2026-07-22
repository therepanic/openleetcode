class Solution {
    func canArrange(_ arr: [Int], _ k: Int) -> Bool {
        var a = arr.map { (($0 % k) + k) % k }.sorted()
        let j = a.prefix(while: { $0 == 0 }).count
        if j % 2 != 0 { return false }
        let b = Array(a[j...])
        for l in 0..<(b.count / 2) {
            if (b[l] + b[b.count - 1 - l]) % k != 0 {
                return false
            }
        }
        return true
    }
}
