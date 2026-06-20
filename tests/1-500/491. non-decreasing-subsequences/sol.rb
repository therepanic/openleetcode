# @param {Integer[]} nums
# @return {Integer[][]}
def find_subsequences(nums)
    result = Set.new
    backtrack = lambda do |index, path|
        if path.length >= 2
            result.add(path.dup)
        end
        (index...nums.length).each do |i|
            if path.empty? || nums[i] >= path.last
                path.push(nums[i])
                backtrack.call(i + 1, path)
                path.pop
            end
        end
    end
    backtrack.call(0, [])
    result.to_a
end
