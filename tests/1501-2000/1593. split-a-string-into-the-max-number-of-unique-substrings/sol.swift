class Solution {
    func maxUniqueSplit(_ s: String) -> Int {
        var used = Set<String>()
        var ans = 0
        
        func backtrack(_ index: Int) {
            if index == s.count {
                ans = max(ans, used.count)
                return
            }
            let chars = Array(s)
            for j in index..<chars.count {
                let curr = String(chars[index...j])
                if used.contains(curr) { continue }
                used.insert(curr)
                backtrack(j + 1)
                used.remove(curr)
            }
        }
        
        backtrack(0)
        return ans
    }
}
