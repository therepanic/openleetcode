def min_wasted_space(packages, boxes)
    packages.sort!
    n = packages.length
    total_package_sum = packages.sum
    
    min_gross_area = Float::INFINITY
    
    boxes.each do |supplier_boxes|
        supplier_boxes.sort!
        next if supplier_boxes[-1] < packages[-1]
        
        gross_area = 0
        low_idx = 0
        
        supplier_boxes.each do |b|
            high_idx = packages.bsearch_index { |x| x > b } || n
            high_idx = n if high_idx.nil?
            if high_idx < low_idx
                high_idx = low_idx
            end
            count = high_idx - low_idx
            if count > 0
                gross_area += b * count
                low_idx = high_idx
            end
            break if low_idx == n
        end
        
        min_gross_area = [min_gross_area, gross_area].min
    end
    
    return -1 if min_gross_area == Float::INFINITY
    (min_gross_area - total_package_sum) % 1_000_000_007
end
