# @param {Integer[][]} buildings
# @return {Integer[][]}
def get_skyline(buildings)
    events = []
    buildings.each do |l, r, h|
        events << [l, -h]
        events << [r, h]
    end
    events.sort!
    
    result = []
    live_buildings = [0]
    past_buildings = Hash.new(0)
    prev_max = 0
    
    events.each do |x, h|
        if h < 0
            # Ruby doesn't have built-in max-heap, so we use negative values in a min-heap
            live_buildings.push(h)
            live_buildings.sort! # maintain heap-like behavior (simplified)
        else
            val_to_remove = -h
            past_buildings[val_to_remove] += 1
        end
        
        # Lazy cleanup
        while past_buildings.has_key?(live_buildings[0])
            top = live_buildings.shift
            past_buildings[top] -= 1
            if past_buildings[top] == 0
                past_buildings.delete(top)
            end
            # re-sort to maintain min-heap property
            live_buildings.sort!
        end
        
        curr_max = -live_buildings[0]
        if curr_max != prev_max
            result << [x, curr_max]
            prev_max = curr_max
        end
    end
    
    result
end
