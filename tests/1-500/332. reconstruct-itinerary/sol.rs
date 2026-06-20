impl Solution {
    pub fn find_itinerary(tickets: Vec<Vec<String>>) -> Vec<String> {
        use std::collections::HashMap;
        
        let mut graph: HashMap<String, Vec<String>> = HashMap::new();
        let mut sorted_tickets = tickets.clone();
        sorted_tickets.sort_by(|a, b| {
            if a[0] != b[0] {
                b[0].cmp(&a[0])
            } else {
                b[1].cmp(&a[1])
            }
        });
        
        for ticket in &sorted_tickets {
            let from = &ticket[0];
            let to = &ticket[1];
            graph.entry(from.clone()).or_insert(Vec::new()).push(to.clone());
        }
        
        let mut st = vec!["JFK".to_string()];
        let mut new_itinerary = Vec::new();
        
        while !st.is_empty() {
            let top = st.last().unwrap();
            if let Some(destinations) = graph.get_mut(top) {
                if !destinations.is_empty() {
                    st.push(destinations.pop().unwrap());
                } else {
                    new_itinerary.push(st.pop().unwrap());
                }
            } else {
                new_itinerary.push(st.pop().unwrap());
            }
        }
        
        new_itinerary.reverse();
        new_itinerary
    }
}
