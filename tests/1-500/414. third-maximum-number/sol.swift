class Solution {
    func thirdMax(_ nums: [Int]) -> Int {
        var first: Int?
        var second: Int?
        var third: Int?
        for num in nums {
            if num == first || num == second || num == third {
                continue
            }
            if first == nil || num > first! {
                third = second
                second = first
                first = num
            } else if second == nil || num > second! {
                third = second
                second = num
            } else if third == nil || num > third! {
                third = num
            }
        }
        return third != nil ? third! : first!
    }
}
