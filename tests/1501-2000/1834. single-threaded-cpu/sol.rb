# @param {Integer[][]} tasks
# @return {Integer[]}
def get_order(tasks)
    n = tasks.length
    indexed_tasks = tasks.each_with_index.map { |task, idx| [task[0], task[1], idx] }
    indexed_tasks.sort_by! { |task| task[0] }
    
    result = []
    heap = []
    time = 0
    i = 0
    
    while i < n || !heap.empty?
        if heap.empty? && time < indexed_tasks[i][0]
            time = indexed_tasks[i][0]
        end
        
        while i < n && indexed_tasks[i][0] <= time
            enqueue, process, index = indexed_tasks[i]
            heap << [process, index]
            heap.sort!
            i += 1
        end
        
        process, index = heap.shift
        result << index
        time += process
    end
    
    result
end
