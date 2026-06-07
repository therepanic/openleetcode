class Solution {
public:
    string countAndSay(int n) {
        string current = "1";
        for (int step = 1; step < n; step++) {
            string next;
            for (int i = 0; i < (int)current.size();) {
                int j = i;
                while (j < (int)current.size() && current[j] == current[i]) j++;
                next += to_string(j - i);
                next.push_back(current[i]);
                i = j;
            }
            current = next;
        }
        return current;
    }
};
