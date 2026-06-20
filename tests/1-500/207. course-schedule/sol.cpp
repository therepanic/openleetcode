class Solution {
public:
    bool canFinish(int numCourses, vector<vector<int>>& prerequisites) {
        vector<vector<int>> graph(numCourses);
        vector<int> indegree(numCourses, 0);
        for (const auto& edge : prerequisites) {
            graph[edge[1]].push_back(edge[0]);
            indegree[edge[0]]++;
        }
        queue<int> q;
        for (int i = 0; i < numCourses; i++) if (indegree[i] == 0) q.push(i);
        int seen = 0;
        while (!q.empty()) {
            int node = q.front();
            q.pop();
            seen++;
            for (int nxt : graph[node]) {
                if (--indegree[nxt] == 0) q.push(nxt);
            }
        }
        return seen == numCourses;
    }
};
