class Solution {
    func arraySign(_ nums: [Int]) -> Int {
        if nums.contains(0) {
            return 0
        }
        let negatives = nums.filter { $0 < 0 }.count
        return negatives % 2 == 0 ? 1 : -1
    }
}
