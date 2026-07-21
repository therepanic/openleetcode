# @param {Integer} tomato_slices
# @param {Integer} cheese_slices
# @return {Integer[]}
def num_of_burgers(tomato_slices, cheese_slices)
    if (tomato_slices - 2 * cheese_slices) % 2 != 0
        return []
    end

    x = (tomato_slices - 2 * cheese_slices) / 2
    y = cheese_slices - x

    if x < 0 || y < 0
        return []
    end

    return [x, y]
end
