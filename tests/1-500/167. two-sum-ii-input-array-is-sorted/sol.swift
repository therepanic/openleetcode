class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var left = 0
        var right = numbers.count - 1
        while left < right {
            let total = numbers[left] + numbers[right]
            if total == target {
                return [left + 1, right + 1]
            }
            if total < target {
                left += 1
            } else {
                right -= 1
            }
        }
        return []
    }
}
