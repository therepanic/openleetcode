class Solution {
    public List<String> findItinerary(String[][] tickets) {
        Map<String, PriorityQueue<String>> graph = new HashMap<>();
        
        for (String[] ticket : tickets) {
            String from = ticket[0];
            String to = ticket[1];
            graph.computeIfAbsent(from, k -> new PriorityQueue<>()).offer(to);
        }
        
        LinkedList<String> st = new LinkedList<>();
        st.push("JFK");
        LinkedList<String> newItinerary = new LinkedList<>();
        
        while (!st.isEmpty()) {
            String top = st.peek();
            if (graph.containsKey(top) && !graph.get(top).isEmpty()) {
                st.push(graph.get(top).poll());
            } else {
                newItinerary.push(st.pop());
            }
        }
        
        return newItinerary;
    }
}
