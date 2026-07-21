class Solution {
public:
    string longestDiverseString(int a, int b, int c) {
        priority_queue<pair<int, char>> maxHeap;
        string res;

        if (a > 0) maxHeap.push({a, 'a'});
        if (b > 0) maxHeap.push({b, 'b'});
        if (c > 0) maxHeap.push({c, 'c'});

        while (!maxHeap.empty()) {
            auto [count, ch] = maxHeap.top();
            maxHeap.pop();

            int len = res.size();
            if (len >= 2 && res[len - 2] == ch && res[len - 1] == ch) {
                if (maxHeap.empty()) {
                    break;
                }
                auto [count2, ch2] = maxHeap.top();
                maxHeap.pop();
                res.push_back(ch2);
                count2--;
                if (count2 > 0) {
                    maxHeap.push({count2, ch2});
                }
            } else {
                res.push_back(ch);
                count--;
            }

            if (count > 0) {
                maxHeap.push({count, ch});
            }
        }

        return res;
    }
};
