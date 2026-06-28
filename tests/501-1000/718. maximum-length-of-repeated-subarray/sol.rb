# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer}
def find_length(nums1, nums2)
    p_val = 113
    mod = 10**9 + 7
    pinv = p_val.pow(mod - 2, mod)

    check = ->(guess) {
        hashes = Hash.new { |h, k| h[k] = [] }

        # rolling hash for nums1
        if guess == 0
            hashes[0] << 0
        else
            h = 0
            power = 1
            nums1.each_with_index do |x, i|
                h = (h + x * power) % mod
                if i < guess - 1
                    power = (power * p_val) % mod
                else
                    start = i - (guess - 1)
                    hashes[h] << start
                    h = (h - nums1[start]) * pinv % mod
                end
            end
        end

        # rolling hash for nums2
        if guess == 0
            return true
        else
            h = 0
            power = 1
            nums2.each_with_index do |x, i|
                h = (h + x * power) % mod
                if i < guess - 1
                    power = (power * p_val) % mod
                else
                    start = i - (guess - 1)
                    if hashes.key?(h)
                        hashes[h].each do |i_start|
                            return true if nums1[i_start, guess] == nums2[start, guess]
                        end
                    end
                    h = (h - nums2[start]) * pinv % mod
                end
            end
        end
        false
    }

    lo = 0
    hi = [nums1.length, nums2.length].min + 1
    while lo < hi
        mi = (lo + hi) / 2
        if check.call(mi)
            lo = mi + 1
        else
            hi = mi
        end
    end
    lo - 1
end
