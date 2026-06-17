class Solution:
    def findItinerary(self, tickets: List[List[str]]) -> List[str]:
        # Create a graph represented as a dictionary where each airport is a key, and its destinations are values.
        graph = defaultdict(list)

        for departure, arrival in sorted(tickets, reverse=True):
            graph[departure].append(arrival)

        # Initialize the stack with the starting airport "JFK" and an empty itinerary.
        st = ["JFK"]
        new_itinerary = []

        while st:
            # If there are destinations from the current airport, add the next destination to the stack.
            if graph[st[-1]]:
                st.append(graph[st[-1]].pop())
            else:
                # When there are no more destinations, add the current airport to the new itinerary.
                new_itinerary.append(st.pop())

        # Reverse the new itinerary to get the correct order.
        return new_itinerary[::-1]