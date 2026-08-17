class Solution {
public:
    int minimumDeviation(vector<int>& nums) {
        if (nums.empty()) return INT_MAX;
        
        priority_queue<int> maxHeap;
        int minVal = INT_MAX;
        
        for (int num : nums) {
            if (num % 2 == 0) {
                maxHeap.push(num);
                minVal = min(num, minVal);
            } else {
                maxHeap.push(num * 2);
                minVal = min(num * 2, minVal);
            }
        }
        
        int res = INT_MAX;
        while (maxHeap.top() % 2 == 0) {
            int maxVal = maxHeap.top();
            maxHeap.pop();
            res = min(res, maxVal - minVal);
            int newNum = maxVal / 2;
            maxHeap.push(newNum);
            minVal = min(newNum, minVal);
        }
        
        res = min(maxHeap.top() - minVal, res);
        return res;
    }
};
