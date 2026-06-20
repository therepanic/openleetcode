class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var counts = [Int: Int]()
        for num in nums1 {
            counts[num, default: 0] += 1
        }

        var result = [Int]()
        for num in nums2 {
            if let count = counts[num], count > 0 {
                result.append(num)
                counts[num] = count - 1
            }
        }

        return result
    }
}
