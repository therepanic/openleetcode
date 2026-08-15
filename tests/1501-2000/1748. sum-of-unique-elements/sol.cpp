class Solution {
public:
    int sumOfUnique(vector<int>& nums) {
        int s=0;
        for(int i:nums){
            int count=0;
            for(int j:nums){
                if(j==i) count++;
            }
            if(count==1) s+=i;
        }
        return s;
    }
};
