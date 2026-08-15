class Solution {
private:
    struct Node {
        string name;
        map<string, Node*> children;
        string signature;
        
        Node(string n) : name(n) {}
    };
    
    unordered_map<string, int> signatureCount;
    
    string dfs(Node* node) {
        if (node->children.empty()) {
            node->signature = "";
            return "";
        }
        
        string childSignatures;
        for (auto& [name, child] : node->children) {
            string childSignature = dfs(child);
            childSignatures += name + "(" + childSignature + ")";
        }
        
        node->signature = childSignatures;
        signatureCount[node->signature]++;
        return node->signature;
    }
    
    void dfs2(Node* node, vector<vector<string>>& result, vector<string>& currentPath) {
        if (!node->children.empty() && signatureCount[node->signature] >= 2) {
            return;
        }
        
        currentPath.push_back(node->name);
        result.push_back(currentPath);
        
        for (auto& [name, child] : node->children) {
            dfs2(child, result, currentPath);
        }
        
        currentPath.pop_back();
    }
    
public:
    vector<vector<string>> deleteDuplicateFolder(vector<vector<string>>& paths) {
        Node* root = new Node("");
        
        for (auto& path : paths) {
            Node* node = root;
            for (auto& folder : path) {
                if (node->children.find(folder) == node->children.end()) {
                    node->children[folder] = new Node(folder);
                }
                node = node->children[folder];
            }
        }
        
        dfs(root);
        
        vector<vector<string>> result;
        vector<string> currentPath;
        
        for (auto& [name, child] : root->children) {
            dfs2(child, result, currentPath);
        }
        
        return result;
    }
};
