class Solution {
public:
    int minimumLengthEncoding(vector<string>& words) {
        unordered_set<string> unique(words.begin(), words.end());
        words.assign(unique.begin(), unique.end());
        TrieNode* trie = new TrieNode();
        vector<TrieNode*> nodes;
        for (const auto& word : words) {
            TrieNode* node = trie;
            for (int i = word.size() - 1; i >= 0; i--) {
                char ch = word[i];
                if (!node->children.count(ch)) {
                    node->children[ch] = new TrieNode();
                }
                node = node->children[ch];
            }
            nodes.push_back(node);
        }
        int ans = 0;
        for (int i = 0; i < words.size(); i++) {
            if (nodes[i]->children.empty()) {
                ans += words[i].size() + 1;
            }
        }
        return ans;
    }
    
private:
    struct TrieNode {
        unordered_map<char, TrieNode*> children;
    };
};
