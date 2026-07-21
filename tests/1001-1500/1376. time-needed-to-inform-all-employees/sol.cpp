class Solution {
public:
    int numOfMinutes(int n, int headID, vector<int>& manager, vector<int>& informTime) {
        vector<vector<int>> children(n);
        for (int employee = 0; employee < n; employee++) {
            int parent = manager[employee];
            if (parent != -1) {
                children[parent].push_back(employee);
            }
        }
        stack<pair<int, int>> st;
        st.push({headID, 0});
        int answer = 0;
        while (!st.empty()) {
            auto [employee, elapsed] = st.top();
            st.pop();
            answer = max(answer, elapsed);
            for (int child : children[employee]) {
                st.push({child, elapsed + informTime[employee]});
            }
        }
        return answer;
    }
};
