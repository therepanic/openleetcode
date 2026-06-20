class Solution {
    func findMaxForm(_ strs: [String], _ m: Int, _ n: Int) -> Int {
        var dp: [String: Int] = ["0,0": 0]
        for s in strs {
            let zeros = s.filter { $0 == "0" }.count
            let ones = s.filter { $0 == "1" }.count
            var newDp = dp
            for (key, size) in dp {
                let parts = key.split(separator: ",").map { Int($0)! }
                let z = parts[0]
                let o = parts[1]
                let newZ = z + zeros
                let newO = o + ones
                if newZ <= m && newO <= n {
                    let newKey = "\(newZ),\(newO)"
                    newDp[newKey] = max(newDp[newKey] ?? 0, size + 1)
                }
            }
            dp = newDp
        }
        return dp.values.max() ?? 0
    }
}
