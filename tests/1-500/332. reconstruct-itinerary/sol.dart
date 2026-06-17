class Solution {
  List<String> findItinerary(List<List<String>> tickets) {
    var graph = <String, List<String>>{};
    
    tickets.sort((a, b) {
      if (a[0] != b[0]) return b[0].compareTo(a[0]);
      return b[1].compareTo(a[1]);
    });
    
    for (var ticket in tickets) {
      graph.putIfAbsent(ticket[0], () => []);
      graph[ticket[0]]!.add(ticket[1]);
    }
    
    var st = ["JFK"];
    var newItinerary = <String>[];
    
    while (st.isNotEmpty) {
      var top = st.last;
      if (graph.containsKey(top) && graph[top]!.isNotEmpty) {
        st.add(graph[top]!.removeLast());
      } else {
        newItinerary.add(st.removeLast());
      }
    }
    
    return newItinerary.reversed.toList();
  }
}
