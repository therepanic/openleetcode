class Solution {
    func findLengthOfShortestSubarray(_ arr: [Int]) -> Int {
        let n = arr.count
        var right = n - 1
        while right > 0 && arr[right - 1] <= arr[right] {
            right -= 1
        }
        if right == 0 { return 0 }
        var answer = right
        var left = 0
        while left == 0 || (left < n && arr[left - 1] <= arr[left]) {
            while right < n && arr[left] > arr[right] {
                right += 1
            }
            answer = min(answer, right - left - 1)
            left += 1
            if left >= n { break }
        }
        return answer
    }
}
