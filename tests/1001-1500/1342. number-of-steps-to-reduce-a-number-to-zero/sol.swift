class Solution {
    func numberOfSteps(_ num: Int) -> Int {
        if num == 0 { return 0 }
        return num.bitWidth - num.leadingZeroBitCount - 1 + num.nonzeroBitCount
    }
}
