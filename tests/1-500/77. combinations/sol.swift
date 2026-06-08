class Solution {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var res = [[Int]]()
        var cur = [Int]()

        func dfs(_ start: Int) {
            if cur.count == k {
                res.append(cur)
                return
            }
            if start > n { return }
            for i in start...n {
                cur.append(i)
                dfs(i + 1)
                cur.removeLast()
            }
        }

        dfs(1)
        return res
    }
}
