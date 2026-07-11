class Solution {
public:
    vector<int> maxDepthAfterSplit(string seq) {
        vector<int> res;
        int depth = 0;
        for (char ch : seq) {
            if (ch == '(') {
                depth++;
                res.push_back(depth % 2);
            } else {
                res.push_back(depth % 2);
                depth--;
            }
        }
        return res;
    }
};
