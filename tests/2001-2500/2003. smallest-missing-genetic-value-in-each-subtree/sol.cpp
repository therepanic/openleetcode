class Solution {
public:
    vector<int> smallestMissingValueSubtree(vector<int>& parents, vector<int>& nums) {
        int n = parents.size();
        vector<vector<int>> graph(n);
        int nodeOne = -1;
        int root = -1;
        
        for (int child = 0; child < n; child++) {
            if (parents[child] == -1) {
                root = child;
            } else {
                graph[parents[child]].push_back(child);
            }
            if (nums[child] == 1) nodeOne = child;
        }
        
        vector<int> results(n, 1);
        if (nodeOne == -1) return results;
        
        vector<bool> seen(100002, false);
        int current = nodeOne;
        int missing = 1;
        
        while (current != -1) {
            markSeen(current, graph, seen, nums);
            while (missing < 100002 && seen[missing]) missing++;
            results[current] = missing;
            current = parents[current];
        }
        
        return results;
    }
    
private:
    void markSeen(int node, vector<vector<int>>& graph, vector<bool>& seen, vector<int>& nums) {
        if (!seen[nums[node]]) {
            seen[nums[node]] = true;
            for (int child : graph[node]) {
                markSeen(child, graph, seen, nums);
            }
        }
    }
};
