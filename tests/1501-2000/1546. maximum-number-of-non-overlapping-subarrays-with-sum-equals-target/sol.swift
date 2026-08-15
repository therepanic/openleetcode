class Solution {
    func maxNonOverlapping(_ nums: [Int], _ target: Int) -> Int {
        var numOfSubarrays = 0
        var temp = 0
        var visited = Set<Int>([0])
        for num in nums {
            temp += num
            let prev = temp - target
            if visited.contains(prev) {
                visited = Set<Int>()
                numOfSubarrays += 1
            }
            visited.insert(temp)
        }
        return numOfSubarrays
    }
}
