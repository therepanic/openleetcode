# @param {Integer[]} nums
# @param {Integer} low
# @param {Integer} high
# @return {Integer}
def count_pairs(nums, low, high)
    max_val = nums.max || 0
    bits = [1, [max_val.to_s(2).length, (high + 1).to_s(2).length].max].max

    count_less = lambda do |bound|
        return 0 if bound <= 0
        child = [[-1, -1]]
        counts = [0]
        total = 0
        nums.each do |value|
            node = 0
            (bits - 1).downto(0) do |bit|
                v = (value >> bit) & 1
                b = (bound >> bit) & 1
                if b == 1
                    same = child[node][v]
                    total += counts[same] unless same == -1
                    nxt = child[node][1 - v]
                else
                    nxt = child[node][v]
                end
                if nxt == -1
                    node = -1
                    break
                end
                node = nxt
            end
            node = 0
            (bits - 1).downto(0) do |bit|
                v = (value >> bit) & 1
                nxt = child[node][v]
                if nxt == -1
                    nxt = child.length
                    child[node][v] = nxt
                    child << [-1, -1]
                    counts << 0
                end
                node = nxt
                counts[node] += 1
            end
        end
        total
    end

    count_less.call(high + 1) - count_less.call(low)
end
