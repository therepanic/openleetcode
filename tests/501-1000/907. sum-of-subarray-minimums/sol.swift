class Solution {
    func sumSubarrayMins(_ arr: [Int]) -> Int {
        let MOD = 1_000_000_007
        let n = arr.count
        var stack = [Int]()
        var res = [Int](repeating: 0, count: n)
        for i in 0..<n {
            while let last = stack.last, arr[last] > arr[i] {
                stack.removeLast()
            }
            let j = stack.last ?? -1
            res[i] = ((j >= 0 ? res[j] : 0) + (i - j) * arr[i]) % MOD
            stack.append(i)
        }
        return res.reduce(0) { ($0 + $1) % MOD }
    }
}
