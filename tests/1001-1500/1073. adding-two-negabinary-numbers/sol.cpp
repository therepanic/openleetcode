class Solution {
public:
    vector<int> addNegabinary(vector<int>& arr1, vector<int>& arr2) {
        vector<int> res;
        int i = arr1.size() - 1, j = arr2.size() - 1;
        int carry = 0;
        
        while (carry != 0 || i >= 0 || j >= 0) {
            if (i >= 0) carry += arr1[i--];
            if (j >= 0) carry += arr2[j--];
            res.push_back(carry & 1);
            carry = -(carry >> 1);
        }
        
        while (res.size() > 1 && res.back() == 0) {
            res.pop_back();
        }
        
        reverse(res.begin(), res.end());
        return res;
    }
};
