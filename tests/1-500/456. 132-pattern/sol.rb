# @param {Integer[]} nums
# @return {Boolean}
def find132pattern(nums)
    st = []
    cur_min = nums[0]

    nums[1..-1].each do |n|
        while !st.empty? && n >= st[-1][0]
            st.pop
        end
        
        if !st.empty? && n > st[-1][1]
            return true
        end
        
        st.push([n, cur_min])
        cur_min = [cur_min, n].min
    end
    
    false
end
