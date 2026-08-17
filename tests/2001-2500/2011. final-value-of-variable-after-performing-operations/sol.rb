# @param {String[]} operations
# @return {Integer}
def final_value_after_operations(operations)
    operations.sum { |op| op[1] == '+' ? 1 : -1 }
end
