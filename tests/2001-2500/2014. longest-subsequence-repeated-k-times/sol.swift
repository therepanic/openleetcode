class Solution {
    func longestSubsequenceRepeatedK(_ s: String, _ k: Int) -> String {
        func isK(_ sub: String, _ t: String, _ k: Int) -> Bool {
            let subArr = Array(sub)
            let tArr = Array(t)
            var count = 0
            var i = 0
            for ch in tArr {
                if i < subArr.count && ch == subArr[i] {
                    i += 1
                    if i == subArr.count {
                        i = 0
                        count += 1
                        if count == k {
                            return true
                        }
                    }
                }
            }
            return false
        }

        var res = ""
        var q: [String] = [""]
        while !q.isEmpty {
            let curr = q.removeFirst()
            for c in 97...122 {
                let nxt = curr + String(UnicodeScalar(c)!)
                if isK(nxt, s, k) {
                    res = nxt
                    q.append(nxt)
                }
            }
        }
        return res
    }
}
