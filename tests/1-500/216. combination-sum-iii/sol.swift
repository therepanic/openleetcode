class Solution {
    func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
        var res = [[Int]]()
        func backtrack(_ start: Int, _ path: inout [Int], _ target: Int, _ k: Int) {
            if target == 0 && k == 0 {
                res.append(path)
                return
            }
            if start > 9 {
                return
            }
            for i in start...9 {
                if i > target || k <= 0 { break }
                path.append(i)
                backtrack(i + 1, &path, target - i, k - 1)
                path.removeLast()
            }
        }
        var path = [Int]()
        backtrack(1, &path, n, k)
        return res
    }
}
