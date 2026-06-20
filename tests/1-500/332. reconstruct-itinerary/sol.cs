public class Solution {
    public IList<string> FindItinerary(IList<IList<string>> tickets) {
        var graph = new Dictionary<string, List<string>>();
        
        var sortedTickets = tickets.OrderByDescending(t => t[0]).ThenByDescending(t => t[1]);
        
        foreach (var ticket in sortedTickets) {
            if (!graph.ContainsKey(ticket[0])) {
                graph[ticket[0]] = new List<string>();
            }
            graph[ticket[0]].Add(ticket[1]);
        }
        
        var st = new Stack<string>();
        st.Push("JFK");
        var newItinerary = new List<string>();
        
        while (st.Count > 0) {
            string top = st.Peek();
            if (graph.ContainsKey(top) && graph[top].Count > 0) {
                st.Push(graph[top][graph[top].Count - 1]);
                graph[top].RemoveAt(graph[top].Count - 1);
            } else {
                newItinerary.Add(st.Pop());
            }
        }
        
        newItinerary.Reverse();
        return newItinerary;
    }
}
