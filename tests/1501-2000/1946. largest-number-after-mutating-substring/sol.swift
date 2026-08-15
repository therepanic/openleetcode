class Solution {
    func maximumNumber(_ num: String, _ change: [Int]) -> String {
        var a = Array(num)
        var flag = false
        for i in 0..<a.count {
            let b = Int(String(a[i]))!
            if b < change[b] {
                a[i] = Character(String(change[b]))
                flag = true
            } else if b == change[b] || !flag {
                continue
            } else {
                break
            }
        }
        return String(a)
    }
}
