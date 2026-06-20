class Solution {
public:
    int magicalString(int n) {
        if (n <= 0) return 0;
        if (n <= 3) return 1;
        vector<int> s = {1, 2, 2};
        int i = 2;
        while (s.size() < n) {
            int nextVal = 3 - s.back();
            int count = s[i];
            for (int j = 0; j < count && s.size() < n; j++) {
                s.push_back(nextVal);
            }
            i++;
        }
        int ones = 0;
        for (int j = 0; j < n; j++) {
            if (s[j] == 1) ones++;
        }
        return ones;
    }
};
