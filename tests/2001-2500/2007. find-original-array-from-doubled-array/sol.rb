# @param {Integer[]} changed
# @return {Integer[]}
def find_original_array(changed)
    return [] if changed.length.odd?
    
    count = Hash.new(0)
    changed.each { |num| count[num] += 1 }
    changed.sort!
    original = []
    
    changed.each do |num|
        next if count[num] == 0
        return [] if count[2 * num] == 0
        original << num
        count[num] -= 1
        count[2 * num] -= 1
    end
    
    original
end
