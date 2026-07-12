class Solution {
public:
    string smallestSubsequence(string s) {
        unordered_map<char, int> fqMap;
        vector<char> stack;
        unordered_set<char> visited;
        for (char ch : s) {
            fqMap[ch]++;
        }
        for (char ch : s) {
            fqMap[ch]--;
            if (visited.count(ch)) {
                continue;
            }
            while (!stack.empty() && ch < stack.back() && fqMap[stack.back()] > 0) {
                visited.erase(stack.back());
                stack.pop_back();
            }
            visited.insert(ch);
            stack.push_back(ch);
        }
        return string(stack.begin(), stack.end());
    }
};
