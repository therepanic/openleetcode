class Solution {
    func findTheDistanceValue(_ arr1: [Int], _ arr2: [Int], _ d: Int) -> Int {
        let sortedArr2 = arr2.sorted()
        var count = 0
        for num in arr1 {
            let leftIndex = lowerBound(sortedArr2, num - d)
            let rightIndex = upperBound(sortedArr2, num + d)
            if leftIndex == rightIndex {
                count += 1
            }
        }
        return count
    }
    
    private func lowerBound(_ arr: [Int], _ target: Int) -> Int {
        var left = 0, right = arr.count
        while left < right {
            let mid = left + (right - left) / 2
            if arr[mid] < target {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return left
    }
    
    private func upperBound(_ arr: [Int], _ target: Int) -> Int {
        var left = 0, right = arr.count
        while left < right {
            let mid = left + (right - left) / 2
            if arr[mid] <= target {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return left
    }
}
