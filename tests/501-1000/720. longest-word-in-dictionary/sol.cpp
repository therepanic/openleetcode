class Solution {
public:
    string longestWord(vector<string>& words) {
        struct TrieNode {
            unordered_map<char, TrieNode*> children;
            int end = -1;
        };

        TrieNode* root = new TrieNode();
        for (int i = 0; i < words.size(); i++) {
            TrieNode* cur = root;
            for (char ch : words[i]) {
                if (!cur->children.count(ch)) {
                    cur->children[ch] = new TrieNode();
                }
                cur = cur->children[ch];
            }
            cur->end = i;
        }

        stack<TrieNode*> stack;
        for (auto& pair : root->children) {
            stack.push(pair.second);
        }
        string ans = "";
        while (!stack.empty()) {
            TrieNode* cur = stack.top();
            stack.pop();
            if (cur->end != -1) {
                string& word = words[cur->end];
                if (word.size() > ans.size() || (word.size() == ans.size() && word < ans)) {
                    ans = word;
                }
                for (auto& pair : cur->children) {
                    stack.push(pair.second);
                }
            }
        }
        return ans;
    }
};
