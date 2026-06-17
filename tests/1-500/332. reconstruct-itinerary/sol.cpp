class Solution {
public:
    vector<string> findItinerary(vector<vector<string>>& tickets) {
        unordered_map<string, priority_queue<string, vector<string>, greater<string>>> graph;
        
        for (const auto& ticket : tickets) {
            graph[ticket[0]].push(ticket[1]);
        }
        
        stack<string> st;
        st.push("JFK");
        vector<string> newItinerary;
        
        while (!st.empty()) {
            string top = st.top();
            if (graph.find(top) != graph.end() && !graph[top].empty()) {
                st.push(graph[top].top());
                graph[top].pop();
            } else {
                newItinerary.push_back(top);
                st.pop();
            }
        }
        
        reverse(newItinerary.begin(), newItinerary.end());
        return newItinerary;
    }
};
