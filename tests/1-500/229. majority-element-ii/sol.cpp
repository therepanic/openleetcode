class Solution {
public:
    vector<int> majorityElement(vector<int>& nums) {
        int majority1 = 0, majority2 = 0, count1 = 0, count2 = 0;

        for (int num : nums) {
            if (num == majority1) {
                count1++;
            } else if (num == majority2) {
                count2++;
            } else if (count1 == 0) {
                majority1 = num;
                count1 = 1;
            } else if (count2 == 0) {
                majority2 = num;
                count2 = 1;
            } else {
                count1--;
                count2--;
            }
        }

        count1 = 0;
        count2 = 0;

        for (int num : nums) {
            if (num == majority1) {
                count1++;
            } else if (num == majority2) {
                count2++;
            }
        }

        vector<int> res;
        if (count1 > nums.size() / 3) {
            res.push_back(majority1);
        }
        if (count2 > nums.size() / 3) {
            res.push_back(majority2);
        }

        return res;
    }
};
