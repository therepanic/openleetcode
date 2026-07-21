class Solution {
public:
    vector<vector<string>> suggestedProducts(vector<string>& products, string searchWord) {
        sort(products.begin(), products.end());
        struct TrieNode {
            map<char, TrieNode*> children;
            vector<string> suggestions;
        };
        TrieNode* root = new TrieNode();
        
        // Insert each product into the Trie and store top 3 suggestions
        for (const string& product : products) {
            TrieNode* node = root;
            for (char ch : product) {
                if (node->children.find(ch) == node->children.end()) {
                    node->children[ch] = new TrieNode();
                }
                node = node->children[ch];
                if (node->suggestions.size() < 3) {
                    node->suggestions.push_back(product);
                }
            }
        }
        
        // Search each character of searchWord in the Trie
        vector<vector<string>> result;
        TrieNode* node = root;
        for (char ch : searchWord) {
            if (node && node->children.find(ch) != node->children.end()) {
                node = node->children[ch];
                result.push_back(node->suggestions);
            } else {
                node = nullptr;
                result.push_back({});
            }
        }
        
        return result;
    }
};
