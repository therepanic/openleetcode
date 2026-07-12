# @param {Integer[]} hand
# @param {Integer} group_size
# @return {Boolean}
def is_n_straight_hand(hand, group_size)
    hashmap = Hash.new(0)
    hand.each { |h| hashmap[h] += 1 }
    
    min_heap = hashmap.keys.sort
    
    until min_heap.empty?
        first = min_heap[0]
        (first...first + group_size).each do |i|
            return false unless hashmap.key?(i)
            hashmap[i] -= 1
            if hashmap[i] == 0
                return false if i != min_heap[0]
                min_heap.shift
            end
        end
    end
    true
end
