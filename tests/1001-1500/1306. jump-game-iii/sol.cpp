class Solution {
public:
    bool canReach(vector<int>& arr, int start) {
        unordered_set<int> seen;
        queue<int> q;
        q.push(start);
        while (!q.empty()) {
            int index = q.front();
            q.pop();
            if (index < 0 || index >= arr.size() || seen.count(index)) {
                continue;
            }
            if (arr[index] == 0) {
                return true;
            }
            seen.insert(index);
            q.push(index + arr[index]);
            q.push(index - arr[index]);
        }
        return false;
    }
};
