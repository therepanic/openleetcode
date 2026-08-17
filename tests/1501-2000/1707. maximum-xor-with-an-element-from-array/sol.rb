# @param {Integer[]} nums
# @param {Integer[][]} queries
# @return {Integer[]}
def maximize_xor(nums, queries)
    left = [-1]
    right = [-1]
    nums.sort!

    queries_with_index = queries.each_with_index.map { |query, i| [query[1], query[0], i] }
    queries_with_index.sort_by!(&:first)

    insert = lambda do |num|
        node = 0
        30.downto(0) do |i|
            bit = (num >> i) & 1
            if bit == 0
                child = left[node]
                if child == -1
                    child = left.length
                    left[node] = child
                    left << -1
                    right << -1
                end
                node = child
            else
                child = right[node]
                if child == -1
                    child = left.length
                    right[node] = child
                    left << -1
                    right << -1
                end
                node = child
            end
        end
    end

    maxor = lambda do |num|
        return -1 if left[0] == -1 && right[0] == -1
        node = 0
        ans = 0
        30.downto(0) do |i|
            bit = (num >> i) & 1
            if bit == 0
                if right[node] != -1
                    ans |= (1 << i)
                    node = right[node]
                else
                    node = left[node]
                end
            elsif left[node] != -1
                ans |= (1 << i)
                node = left[node]
            else
                node = right[node]
            end
        end
        ans
    end

    res = Array.new(queries.length, -1)
    idx = 0
    n = nums.length
    queries_with_index.each do |m, x, i|
        while idx < n && nums[idx] <= m
            insert.call(nums[idx])
            idx += 1
        end
        res[i] = maxor.call(x)
    end
    res
end
