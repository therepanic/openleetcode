class Solution {
public:
    int oddEvenJumps(vector<int>& arr) {
        int n = arr.size();
        vector<int> nextHigher(n, -1);
        vector<int> nextLower(n, -1);
        
        vector<int> indices(n);
        iota(indices.begin(), indices.end(), 0);
        
        sort(indices.begin(), indices.end(), [&](int a, int b) {
            return arr[a] < arr[b];
        });
        vector<int> stack;
        for (int i : indices) {
            while (!stack.empty() && i > stack.back()) {
                nextHigher[stack.back()] = i;
                stack.pop_back();
            }
            stack.push_back(i);
        }
        
        sort(indices.begin(), indices.end(), [&](int a, int b) {
            return arr[a] > arr[b];
        });
        stack.clear();
        for (int i : indices) {
            while (!stack.empty() && i > stack.back()) {
                nextLower[stack.back()] = i;
                stack.pop_back();
            }
            stack.push_back(i);
        }
        
        vector<bool> odd(n, false);
        vector<bool> even(n, false);
        odd[n - 1] = true;
        even[n - 1] = true;
        
        int result = 1;
        for (int i = n - 2; i >= 0; i--) {
            if (nextHigher[i] != -1) {
                odd[i] = even[nextHigher[i]];
            }
            if (nextLower[i] != -1) {
                even[i] = odd[nextLower[i]];
            }
            if (odd[i]) result++;
        }
        return result;
    }
};
