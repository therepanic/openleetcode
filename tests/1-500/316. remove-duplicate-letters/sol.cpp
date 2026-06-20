class Solution {
public:
    string removeDuplicateLetters(string s) {
        unordered_map<char, int> lastOccur;
        for (int i = 0; i < s.length(); i++) {
            lastOccur[s[i]] = i;
        }
        
        string stack = "";
        unordered_set<char> visited;
        
        for (int i = 0; i < s.length(); i++) {
            char c = s[i];
            if (visited.count(c)) {
                continue;
            }
            
            while (!stack.empty() && c < stack.back() && i < lastOccur[stack.back()]) {
                visited.erase(stack.back());
                stack.pop_back();
            }
            
            visited.insert(c);
            stack.push_back(c);
        }
        
        return stack;
    }
};
