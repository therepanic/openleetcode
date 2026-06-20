class Solution {
    fun findItinerary(tickets: Array<Array<String>>): List<String> {
        val graph = mutableMapOf<String, PriorityQueue<String>>()
        
        for (ticket in tickets) {
            val from = ticket[0]
            val to = ticket[1]
            graph.getOrPut(from) { PriorityQueue() }.offer(to)
        }
        
        val st = ArrayDeque<String>()
        st.addLast("JFK")
        val newItinerary = mutableListOf<String>()
        
        while (st.isNotEmpty()) {
            val top = st.last()
            if (graph.containsKey(top) && graph[top]!!.isNotEmpty()) {
                st.addLast(graph[top]!!.poll())
            } else {
                newItinerary.add(st.removeLast())
            }
        }
        
        return newItinerary.reversed()
    }
}
