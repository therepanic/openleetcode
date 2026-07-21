class Solution {
    func countLargestGroup(_ n: Int) -> Int {
        var mpp = [Int: Int]()
        var maxi = 0
        var count = 0

        for i in 1...n {
            let x = digsum(i)
            mpp[x] = (mpp[x] ?? 0) + 1
            maxi = max(maxi, mpp[x]!)
        }

        for v in mpp.values {
            if v == maxi {
                count += 1
            }
        }
        return count
    }

    private func digsum(_ n: Int) -> Int {
        var num = n
        var s = 0
        while num > 0 {
            s += num % 10
            num /= 10
        }
        return s
    }
}
