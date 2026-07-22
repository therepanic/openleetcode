class Solution {
    func maxLength(_ arr: [String]) -> Int {
        var ans = 0
        let n = arr.count

        func isUnique(_ s: String) -> Bool {
            return Set(s).count == s.count
        }

        func hasCommon(_ a: String, _ b: String) -> Bool {
            return !Set(a).intersection(Set(b)).isEmpty
        }

        func dfs(_ i: Int, _ path: String) {
            ans = max(ans, path.count)
            for j in i..<n {
                let s = arr[j]
                if !isUnique(s) || hasCommon(path, s) { continue }
                dfs(j + 1, path + s)
            }
        }

        dfs(0, "")
        return ans
    }
}
