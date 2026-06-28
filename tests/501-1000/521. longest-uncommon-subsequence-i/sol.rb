# @param {String} a
# @param {String} b
# @return {Integer}
def find_lu_slength(a, b)
    if a == b
        return -1
    else
        return [a.length, b.length].max
    end
end
