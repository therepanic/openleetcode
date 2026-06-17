import heapq

class Solution:
    def getSkyline(self, buildings: List[List[int]]) -> List[List[int]]:
        
        # --- PART 1: PRE-PROCESSING (The Event Transformation) ---
        # Turn rectangles into a sorted timeline of events.
        events = []
        for L, R, H in buildings:
            # Trick B: Use negative height for Starts to ensure they process first
            events.append((L, -H)) 
            events.append((R, H))  
        
        # Sort by x, then by height
        events.sort()
        
        # --- PART 2: THE SCANNER STATE ---
        result = []
        live_buildings = [0]       # Max-Heap (stores -height). Init with ground (0).
        past_buildings = {}        # Trick C: The "Lazy Removal" Notebook.
        prev_max = 0               # To track changes.
        
        # --- PART 3: THE SWEEP ---
        for x, h in events:
            
            # A. EVENT HANDLING
            if h < 0:
                # Start Event: Add building to the pile
                heapq.heappush(live_buildings, h)
            else:
                # End Event: Mark building for removal later
                # We can't remove from the middle of the heap, so we just log it.
                # Note: 'h' is positive here, but the heap stores negative '-h'.
                val_to_remove = -h
                past_buildings[val_to_remove] = past_buildings.get(val_to_remove, 0) + 1
            
            # B. CLEANUP (The "Lazy" Loop)
            # Remove "dead" buildings ONLY if they are blocking the top view.
            while live_buildings[0] in past_buildings:
                top = live_buildings[0]
                heapq.heappop(live_buildings) # Physical removal happens here
                
                past_buildings[top] -= 1
                if past_buildings[top] == 0:
                    del past_buildings[top]
            
            # C. RECORD SNAPSHOT
            # The skyline height is ALWAYS the top of the heap.
            curr_max = -live_buildings[0]
            
            if curr_max != prev_max:
                result.append([x, curr_max])
                prev_max = curr_max
                
        return result