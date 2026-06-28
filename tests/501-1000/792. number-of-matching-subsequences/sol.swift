class Solution {
    func numMatchingSubseq(_ s: String, _ words: [String]) -> Int {
        let n = s.count
        var mp = [Character: [Int]]()
        for (i, c) in s.enumerated() {
            mp[c, default: []].append(i)
        }
        for i in 0..<26 {
            let c = Character(UnicodeScalar(97 + i)!)
            mp[c, default: []].append(n)
            mp[c]!.sort()
        }
        
        func found(_ word: String) -> Bool {
            var curr = -1
            for c in word {
                if curr >= n { return false }
                let arr = mp[c]!
                var left = 0, right = arr.count
                while left < right {
                    let mid = left + (right - left) / 2
                    if arr[mid] < curr + 1 {
                        left = mid + 1
                    } else {
                        right = mid
                    }
                }
                curr = arr[left]
            }
            return curr < n
        }
        
        var cnt = 0
        for word in words {
            if found(word) { cnt += 1 }
        }
        return cnt
    }
}
