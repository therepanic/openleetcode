# @param {Integer[]} status
# @param {Integer[]} candies
# @param {Integer[][]} keys
# @param {Integer[][]} contained_boxes
# @param {Integer[]} initial_boxes
# @return {Integer}
def max_candies(status, candies, keys, contained_boxes, initial_boxes)
    owned = initial_boxes.to_set
    opened = Set.new
    changed = true
    total_candies = 0
    while changed
        changed = false
        owned.to_a.each do |box_id|
            next if opened.include?(box_id) || status[box_id] == 0
            opened.add(box_id)
            changed = true
            total_candies += candies[box_id]
            keys[box_id].each { |key_id| status[key_id] = 1 }
            owned.merge(contained_boxes[box_id])
        end
    end
    total_candies
end
