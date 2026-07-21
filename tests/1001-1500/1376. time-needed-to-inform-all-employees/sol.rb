# @param {Integer} n
# @param {Integer} head_id
# @param {Integer[]} manager
# @param {Integer[]} inform_time
# @return {Integer}
def num_of_minutes(n, head_id, manager, inform_time)
    children = Array.new(n) { [] }
    manager.each_with_index do |parent, employee|
        children[parent].append(employee) if parent != -1
    end
    stack = [[head_id, 0]]
    answer = 0
    while !stack.empty?
        employee, elapsed = stack.pop
        answer = [answer, elapsed].max
        children[employee].each do |child|
            stack.append([child, elapsed + inform_time[employee]])
        end
    end
    answer
end
