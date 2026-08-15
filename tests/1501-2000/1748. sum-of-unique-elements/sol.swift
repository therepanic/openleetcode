class Solution {
    func sumOfUnique(_ nums: [Int]) -> Int {
        var s=0
        for i in nums{
            if nums.filter{$0==i}.count==1{s+=i}
        }
        return s
    }
}
