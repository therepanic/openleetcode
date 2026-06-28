# @param {Character[]} tasks
# @param {Integer} n
# @return {Integer}
def least_interval(tasks, n)
    count = Hash.new(0)
    tasks.each { |t| count[t] += 1 }
    f_max = count.values.max
    max_count = count.values.count { |v| v == f_max }
    [tasks.length, (f_max - 1) * (n + 1) + max_count].max
end
