# @param {Integer[]} group_sizes
# @return {Integer[][]}
def group_the_people(group_sizes)
    ans = []
    mp = Hash.new { |h, k| h[k] = [] }
    group_sizes.each_with_index do |val, i|
        if mp[val].length < val
            mp[val] << i
            if mp[val].length == val
                ans << mp[val]
                mp[val] = []
            end
        end
    end
    ans
end
