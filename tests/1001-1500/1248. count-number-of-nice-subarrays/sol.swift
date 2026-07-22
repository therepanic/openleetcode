class Solution {
    func numberOfSubarrays(_ nums: [Int], _ k: Int) -> Int {
        var count = [0: 1]
        var odd = 0
        var answer = 0
        for value in nums {
            odd += value % 2
            answer += count[odd - k] ?? 0
            count[odd, default: 0] += 1
        }
        return answer
    }
}
