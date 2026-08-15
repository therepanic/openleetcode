public class Solution {
    public int SumOfUnique(int[] nums) {
        int s=0;
        foreach(int i in nums){
            int count=0;
            foreach(int j in nums){
                if(j==i) count++;
            }
            if(count==1) s+=i;
        }
        return s;
    }
}
