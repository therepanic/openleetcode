class Solution {

    func maxProductDifference(_ nums: [Int]) -> Int {

        let sorted = nums.sorted()
        let n = sorted.count
        return (sorted[n-1] * sorted[n-2]) - (sorted[0] * sorted[1])

    }

}
