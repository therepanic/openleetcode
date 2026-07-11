class Solution {
public:
    vector<int> movesToStamp(string stamp, string target) {
        int m = stamp.length();
        int n = target.length();
        
        auto canStamp = [&](int i) -> bool {
            for (int j = 0; j < m; j++) {
                if (target[i + j] != '?' && target[i + j] != stamp[j]) {
                    return false;
                }
            }
            return true;
        };
        
        auto applyStamp = [&](int i) {
            for (int j = 0; j < m; j++) {
                target[i + j] = '?';
            }
        };
        
        vector<bool> stamped(n, false);
        vector<int> result;
        deque<int> queue;
        
        for (int i = 0; i <= n - m; i++) {
            if (canStamp(i)) {
                applyStamp(i);
                queue.push_back(i);
                result.push_back(i);
                stamped[i] = true;
            }
        }
        
        while (!queue.empty()) {
            int pos = queue.front();
            queue.pop_front();
            int start = max(0, pos - m + 1);
            int end = min(n - m, pos + m);
            for (int i = start; i <= end; i++) {
                if (canStamp(i)) {
                    if (!stamped[i]) {
                        applyStamp(i);
                        queue.push_back(i);
                        result.push_back(i);
                        stamped[i] = true;
                    }
                }
            }
        }
        
        for (char c : target) {
            if (c != '?') {
                return {};
            }
        }
        
        reverse(result.begin(), result.end());
        return result;
    }
};
