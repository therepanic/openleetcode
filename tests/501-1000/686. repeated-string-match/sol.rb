# @param {String} a
# @param {String} b
# @return {Integer}
def repeated_string_match(a, b)
    repeat_a = a
    count = 1

    while repeat_a.length < b.length
        repeat_a += a
        count += 1
        return count if repeat_a.include?(b)
    end

    repeat_a += a
    count += 1
    return count if repeat_a.include?(b)

    -1
end
