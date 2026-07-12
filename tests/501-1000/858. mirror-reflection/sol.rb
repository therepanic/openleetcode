# @param {Integer} p
# @param {Integer} q
# @return {Integer}
def mirror_reflection(p, q)
    while p.even? && q.even?
        p /= 2
        q /= 2
    end
    return 2 if p.even?
    return 0 if q.even?
    1
end
