# @param {Integer} sx
# @param {Integer} sy
# @param {Integer} tx
# @param {Integer} ty
# @return {Boolean}
def reaching_points(sx, sy, tx, ty)
    while tx >= sx && ty >= sy
        if tx == sx
            return (ty - sy) % tx == 0
        end
        if ty == sy
            return (tx - sx) % ty == 0
        end
        if ty > tx
            ty = ty % tx
        else
            tx = tx % ty
        end
    end
    return false
end
