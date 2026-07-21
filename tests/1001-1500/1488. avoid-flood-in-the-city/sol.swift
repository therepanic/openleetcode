class Solution {
    func avoidFlood(_ rains: [Int]) -> [Int] {
        let n = rains.count
        var res = Array(repeating: -1, count: n)
        var full = [Int: Int]()
        var dry = [Int]()
        for i in 0..<n {
            let lake = rains[i]
            if lake == 0 {
                dry.append(i)
                res[i] = 1
            } else if let prev = full[lake] {
                // binary search for first index > prev
                var left = 0, right = dry.count
                while left < right {
                    let mid = left + (right - left) / 2
                    if dry[mid] <= prev {
                        left = mid + 1
                    } else {
                        right = mid
                    }
                }
                if left == dry.count {
                    return []
                }
                let j = dry[left]
                res[j] = lake
                dry.remove(at: left)
                full[lake] = i
            } else {
                full[lake] = i
            }
        }
        return res
    }
}
