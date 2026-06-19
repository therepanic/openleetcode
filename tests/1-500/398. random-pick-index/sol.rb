class Solution

=begin
    :type nums: Integer[]
=end
    def initialize(nums)
        @d = {}
        nums.each_with_index do |v, i|
            @d[v] = [] unless @d.key?(v)
            @d[v] << i
        end
    end


=begin
    :type target: Integer
    :rtype: Integer
=end
    def pick(target)
        @d[target].sample
    end


end
