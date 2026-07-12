class Solution {
    func maxTurbulenceSize(_ arr: [Int]) -> Int {
        let N = arr.count
        if N < 2 { return N }

        var ans = 1
        var anchor = 0

        func compare(_ x: Int, _ y: Int) -> Int {
            if x < y { return -1 }
            if x > y { return 1 }
            return 0
        }

        for i in 1..<N {
            let c = compare(arr[i - 1], arr[i])
            if c == 0 {
                anchor = i
            } else {
                if i == N - 1 || c * compare(arr[i], arr[i + 1]) != -1 {
                    ans = max(ans, i - anchor + 1)
                    anchor = i
                }
            }
        }
        return ans
    }
}
