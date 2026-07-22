class Solution {
    func arrayRankTransform(_ arr: [Int]) -> [Int] {
        let s = arr.sorted()
        var unique = [Int]()
        for x in s {
            if unique.isEmpty || unique.last! != x {
                unique.append(x)
            }
        }
        var result = arr
        for i in 0..<result.count {
            result[i] = bisectLeft(unique, result[i]) + 1
        }
        return result
    }
    
    private func bisectLeft(_ a: [Int], _ x: Int) -> Int {
        var lo = 0, hi = a.count
        while lo < hi {
            let mid = (lo + hi) / 2
            if a[mid] < x {
                lo = mid + 1
            } else {
                hi = mid
            }
        }
        return lo
    }
}
