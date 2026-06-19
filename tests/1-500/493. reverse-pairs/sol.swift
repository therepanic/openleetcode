class Solution {
    func reversePairs(_ nums: [Int]) -> Int {
        func sortCount(_ arr: [Int]) -> ([Int], Int) {
            let n = arr.count
            if n <= 1 {
                return (arr, 0)
            }

            let mid = n / 2
            let (left, leftCount) = sortCount(Array(arr[0..<mid]))
            let (right, rightCount) = sortCount(Array(arr[mid..<n]))

            var count = leftCount + rightCount

            var j = 0
            for x in left {
                while j < right.count && x > 2 * right[j] {
                    j += 1
                }
                count += j
            }

            var merged: [Int] = []
            var i = 0
            j = 0
            while i < left.count && j < right.count {
                if left[i] <= right[j] {
                    merged.append(left[i])
                    i += 1
                } else {
                    merged.append(right[j])
                    j += 1
                }
            }

            if i < left.count {
                merged.append(contentsOf: left[i...])
            }
            if j < right.count {
                merged.append(contentsOf: right[j...])
            }

            return (merged, count)
        }

        return sortCount(nums).1
    }
}
