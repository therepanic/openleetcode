# @param {String[][]} tickets
# @return {String[]}
def find_itinerary(tickets)
    graph = Hash.new { |hash, key| hash[key] = [] }
    
    tickets.sort.reverse.each do |dep, arr|
        graph[dep] << arr
    end
    
    st = ["JFK"]
    new_itinerary = []
    
    while !st.empty?
        if !graph[st[-1]].empty?
            st << graph[st[-1]].pop
        else
            new_itinerary << st.pop
        end
    end
    
    new_itinerary.reverse
end
