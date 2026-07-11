class Solution {
public:
    vector<int> nextLargerNodes(ListNode* head) {
        vector<int> arr;
        while (head) {
            arr.push_back(head->val);
            head = head->next;
        }
        int n = arr.size();
        vector<int> ans(n, 0);
        vector<int> stack;
        for (int i = 0; i < n; i++) {
            while (!stack.empty() && arr[i] > arr[stack.back()]) {
                ans[stack.back()] = arr[i];
                stack.pop_back();
            }
            stack.push_back(i);
        }
        return ans;
    }
};
