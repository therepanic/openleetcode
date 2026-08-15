class Solution {
  int sumOfUnique(List<int> nums) {
    int s=0;
    for(int i in nums){
      if(nums.where((x)=>x==i).length==1) s+=i;
    }
    return s;
  }
}
