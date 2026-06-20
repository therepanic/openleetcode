# @param {Integer[]} nums
# @return {Boolean}
def circular_array_loop(nums)
    n = nums.length
    done = Array.new(n, false)
    stamp = 0
    seen = Array.new(n, -1)
    path = []

    next_index = lambda do |i|
        ((i + nums[i]) % n + n) % n
    end

    (0...n).each do |i|
        next if done[i]

        stamp += 1
        path.clear
        dir = nums[i] > 0
        cur = i

        while (nums[cur] > 0) == dir && !done[cur]
            if seen[cur] == stamp
                nxt = next_index.call(cur)
                return true if nxt != cur
                break
            end
            seen[cur] = stamp
            path << cur
            nxt = next_index.call(cur)
            break if nxt == cur
            cur = nxt
        end

        path.each do |idx|
            done[idx] = true
        end
    end

    false
end

def circularArrayLoop(nums)
    circular_array_loop(nums)
end
