# @param {Integer[]} nums
# @return {Integer}
def reverse_pairs(nums)
    def sort_count(arr)
        n = arr.length
        return [arr, 0] if n <= 1

        mid = n / 2
        left, left_count = sort_count(arr[0...mid])
        right, right_count = sort_count(arr[mid..-1])

        count = left_count + right_count

        j = 0
        left.each do |x|
            while j < right.length && x > 2 * right[j]
                j += 1
            end
            count += j
        end

        merged = []
        i = 0
        j = 0
        while i < left.length && j < right.length
            if left[i] <= right[j]
                merged << left[i]
                i += 1
            else
                merged << right[j]
                j += 1
            end
        end

        merged.concat(left[i..-1]) if i < left.length
        merged.concat(right[j..-1]) if j < right.length

        [merged, count]
    end

    sort_count(nums)[1]
end
