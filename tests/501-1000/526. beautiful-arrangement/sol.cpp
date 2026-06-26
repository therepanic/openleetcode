class Solution {
public:
    int countArrangement(int n) {
        vector<bool> visited(n + 1, false);
        return backtrack(1, n, visited);
    }
    
private:
    int backtrack(int index, int n, vector<bool>& visited) {
        if (index > n) {
            return 1;
        }
        int count = 0;
        for (int i = 1; i <= n; i++) {
            if (!visited[i] && (i % index == 0 || index % i == 0)) {
                visited[i] = true;
                count += backtrack(index + 1, n, visited);
                visited[i] = false;
            }
        }
        return count;
    }
};
