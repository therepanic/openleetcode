# @param {Integer[]} arr
# @param {Integer[][]} pieces
# @return {Boolean}
def can_form_array(arr, pieces)
    a = []
    arr.each do |i|
        pieces.each_with_index do |j, idx|
            if j.include?(i)
                j.each { |k| a << k }
                pieces.delete_at(idx)
                break
            end
        end
    end
    a == arr
end
