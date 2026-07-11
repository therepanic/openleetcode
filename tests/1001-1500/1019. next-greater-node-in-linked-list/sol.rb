def next_larger_nodes(head)
    arr = []
    while head
        arr << head.val
        head = head.next
    end
    n = arr.length
    ans = Array.new(n, 0)
    stack = []
    (0...n).each do |i|
        while !stack.empty? && arr[i] > arr[stack.last]
            ans[stack.pop] = arr[i]
        end
        stack << i
    end
    ans
end
