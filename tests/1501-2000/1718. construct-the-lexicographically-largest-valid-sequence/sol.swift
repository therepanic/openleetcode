class Solution {
    func constructDistancedSequence(_ n: Int) -> [Int] {
        var result = Array(repeating: 0, count: 2 * n - 1)
        var used = Array(repeating: false, count: n + 1)
        backtrack(&result, &used, n, 0)
        return result
    }

    private func backtrack(_ result: inout [Int], _ used: inout [Bool], _ n: Int, _ index: Int) -> Bool {
        var idx = index
        while idx < result.count && result[idx] != 0 {
            idx += 1
        }
        if idx == result.count {
            return true
        }

        for i in stride(from: n, through: 1, by: -1) {
            if used[i] {
                continue
            }

            if i == 1 {
                result[idx] = 1
                used[1] = true
                if backtrack(&result, &used, n, idx + 1) {
                    return true
                }
                result[idx] = 0
                used[1] = false
            } else if idx + i < result.count && result[idx + i] == 0 {
                result[idx] = i
                result[idx + i] = i
                used[i] = true
                if backtrack(&result, &used, n, idx + 1) {
                    return true
                }
                result[idx] = 0
                result[idx + i] = 0
                used[i] = false
            }
        }

        return false
    }
}
