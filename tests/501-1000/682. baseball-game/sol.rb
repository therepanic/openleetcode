# @param {String[]} operations
# @return {Integer}
def cal_points(operations)
    stack = []
    operations.each do |op|
        if op == "C"
            stack.pop
        elsif op == "D"
            stack.push(stack.last * 2)
        elsif op == "+"
            stack.push(stack[-1] + stack[-2])
        else
            stack.push(op.to_i)
        end
    end
    stack.sum
end
