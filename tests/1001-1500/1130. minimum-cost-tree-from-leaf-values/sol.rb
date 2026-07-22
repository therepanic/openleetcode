# @param {Integer[]} arr
# @return {Integer}
def mct_from_leaf_values(arr)
    result = 0
    st = [Float::INFINITY]

    arr.each do |a|
        while st[-1] <= a
            mid = st.pop
            result += mid * [st[-1], a].min
        end
        st.push(a)
    end

    first = st.pop
    while st.length > 1
        result += first * st[-1]
        first = st.pop
    end

    result
end
