class Solution {
    func countRangeSum(_ nums: [Int], _ lower: Int, _ upper: Int) -> Int {
        var prefix = [Int64](repeating: 0, count: nums.count + 1)
        for i in 0..<nums.count {
            prefix[i + 1] = prefix[i] + Int64(nums[i])
        }

        var buffer = [Int64](repeating: 0, count: prefix.count)
        return Int(countWhileMergeSort(&prefix, &buffer, 0, prefix.count, Int64(lower), Int64(upper)))
    }

    private func countWhileMergeSort(
        _ prefix: inout [Int64],
        _ buffer: inout [Int64],
        _ left: Int,
        _ right: Int,
        _ lower: Int64,
        _ upper: Int64
    ) -> Int64 {
        if right - left <= 1 {
            return 0
        }

        let mid = left + (right - left) / 2
        var count = countWhileMergeSort(&prefix, &buffer, left, mid, lower, upper)
        count += countWhileMergeSort(&prefix, &buffer, mid, right, lower, upper)

        var low = mid
        var high = mid
        for i in left..<mid {
            while low < right && prefix[low] - prefix[i] < lower {
                low += 1
            }
            while high < right && prefix[high] - prefix[i] <= upper {
                high += 1
            }
            count += Int64(high - low)
        }

        var p1 = left
        var p2 = mid
        var idx = left
        while p1 < mid && p2 < right {
            if prefix[p1] <= prefix[p2] {
                buffer[idx] = prefix[p1]
                p1 += 1
            } else {
                buffer[idx] = prefix[p2]
                p2 += 1
            }
            idx += 1
        }
        while p1 < mid {
            buffer[idx] = prefix[p1]
            p1 += 1
            idx += 1
        }
        while p2 < right {
            buffer[idx] = prefix[p2]
            p2 += 1
            idx += 1
        }
        for i in left..<right {
            prefix[i] = buffer[i]
        }

        return count
    }
}
