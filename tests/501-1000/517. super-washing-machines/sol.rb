# @param {Integer[]} machines
# @return {Integer}
def find_min_moves(machines)
    n = machines.length
    total = machines.sum
    avg = total / n
    return -1 if total % n != 0
    imbalances = machines.map { |m| m - avg }
    res = -1.0 / 0.0
    d_i = 0
    imbalances.each do |imb|
        res = [res, d_i.abs].max
        res = [res, imb].max
        d_i += imb
    end
    res
end
