class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        if digits.isEmpty { return [] }
        let map = ["", "", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"]
        var res = [String]()
        var cur = ""
        let chars = Array(digits)
        dfs(chars, 0, map, &cur, &res)
        return res
    }

    private func dfs(_ digits: [Character], _ idx: Int, _ map: [String], _ cur: inout String, _ res: inout [String]) {
        if idx == digits.count {
            res.append(cur)
            return
        }
        let letters = Array(map[Int(String(digits[idx]))!])
        for ch in letters {
            cur.append(ch)
            dfs(digits, idx + 1, map, &cur, &res)
            cur.removeLast()
        }
    }
}
