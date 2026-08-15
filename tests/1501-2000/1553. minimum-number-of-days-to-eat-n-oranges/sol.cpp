class Solution {
public:
    int minDays(int n) {
        int ans = 0;
        queue<int> q;
        q.push(n);
        unordered_set<int> seen;
        while (!q.empty()) {
            int size = q.size();
            for (int i = 0; i < size; ++i) {
                int x = q.front(); q.pop();
                if (x == 0) return ans;
                seen.insert(x);
                if (seen.find(x-1) == seen.end()) q.push(x-1);
                if (x % 2 == 0 && seen.find(x/2) == seen.end()) q.push(x/2);
                if (x % 3 == 0 && seen.find(x/3) == seen.end()) q.push(x/3);
            }
            ans++;
        }
        return ans;
    }
};
