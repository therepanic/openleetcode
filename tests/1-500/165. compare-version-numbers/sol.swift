class Solution {
    func compareVersion(_ version1: String, _ version2: String) -> Int {
        let a = version1.split(separator: ".", omittingEmptySubsequences: false)
        let b = version2.split(separator: ".", omittingEmptySubsequences: false)
        let n = max(a.count, b.count)
        for i in 0..<n {
            let x = i < a.count ? Int(a[i])! : 0
            let y = i < b.count ? Int(b[i])! : 0
            if x < y { return -1 }
            if x > y { return 1 }
        }
        return 0
    }
}
