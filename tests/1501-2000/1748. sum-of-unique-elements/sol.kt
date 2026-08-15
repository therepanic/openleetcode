class Solution {
    fun sumOfUnique(nums: IntArray): Int {
        var s=0
        for(i in nums){
            if(nums.count{it==i}==1) s+=i
        }
        return s
    }
}
