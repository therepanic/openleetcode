class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var seen: [Int: Int] = [:]
        for (i, num) in nums.enumerated() {
            let need = target - num
            if let j = seen[need] {
                return [j, i]
            }
            seen[num] = i
        }
        return []
    }
}
