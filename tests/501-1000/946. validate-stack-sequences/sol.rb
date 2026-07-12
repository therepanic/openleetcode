# @param {Integer[]} pushed
# @param {Integer[]} popped
# @return {Boolean}
def validate_stack_sequences(pushed, popped)
    st = []
    j = 0
    pushed.each do |x|
        st.push(x)
        while !st.empty? && j < popped.length && st.last == popped[j]
            st.pop
            j += 1
        end
    end
    return j == popped.length
end
