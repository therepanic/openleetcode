class Solution {
    func mergeTriplets(_ triplets: [[Int]], _ target: [Int]) -> Bool {
        if triplets.contains(where: { $0 == target }) {
            return true
        }
        var curr = [0, 0, 0]
        for t in triplets {
            var flag = false
            if target[0] == t[0] && curr[0] != target[0] {
                flag = true
            }
            if target[1] == t[1] && curr[1] != target[1] {
                flag = true
            }
            if target[2] == t[2] && curr[2] != target[2] {
                flag = true
            }
            if flag {
                let temp = curr
                curr[0] = max(curr[0], t[0])
                curr[1] = max(curr[1], t[1])
                curr[2] = max(curr[2], t[2])
                if curr[0] > target[0] || curr[1] > target[1] || curr[2] > target[2] {
                    curr = temp
                }
            }
        }
        return curr == target
    }
}
