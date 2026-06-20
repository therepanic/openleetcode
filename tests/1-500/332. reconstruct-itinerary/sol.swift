class Solution {
    func findItinerary(_ tickets: [[String]]) -> [String] {
        var graph = [String: [String]]()
        
        let sortedTickets = tickets.sorted {
            if $0[0] != $1[0] { return $0[0] > $1[0] }
            return $0[1] > $1[1]
        }
        
        for ticket in sortedTickets {
            let from = ticket[0]
            let to = ticket[1]
            graph[from, default: []].append(to)
        }
        
        var st = ["JFK"]
        var newItinerary = [String]()
        
        while !st.isEmpty {
            let top = st.last!
            if let destinations = graph[top], !destinations.isEmpty {
                st.append(graph[top]!.removeLast())
            } else {
                newItinerary.append(st.removeLast())
            }
        }
        
        return newItinerary.reversed()
    }
}
