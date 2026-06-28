# @param {Integer} m
# @param {Integer} n
# @param {Integer[][]} ops
# @return {Integer}
def max_count(m, n, ops)
    return m * n if ops.empty?
    ops.each do |a, b|
        m = [m, a].min
        n = [n, b].min
    end
    m * n
end
