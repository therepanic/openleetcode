# @param {Integer} buckets
# @param {Integer} minutes_to_die
# @param {Integer} minutes_to_test
# @return {Integer}
def poor_pigs(buckets, minutes_to_die, minutes_to_test)
    base = minutes_to_test / minutes_to_die + 1
    ans = 0
    n = 1
    while n < buckets
        n *= base
        ans += 1
    end
    ans
end
