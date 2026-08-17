class Solution {
public:
    string longestSubsequenceRepeatedK(string s, int k) {
        auto isK = [&](const string& sub, const string& t, int k) {
            int count = 0;
            int i = 0;
            for (char ch : t) {
                if (i < sub.size() && ch == sub[i]) {
                    i++;
                    if (i == sub.size()) {
                        i = 0;
                        count++;
                        if (count == k) return true;
                    }
                }
            }
            return false;
        };

        string res = "";
        queue<string> q;
        q.push("");
        while (!q.empty()) {
            string curr = q.front();
            q.pop();
            for (char ch = 'a'; ch <= 'z'; ch++) {
                string nxt = curr + ch;
                if (isK(nxt, s, k)) {
                    res = nxt;
                    q.push(nxt);
                }
            }
        }
        return res;
    }
};
