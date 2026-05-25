# Build a method #bubble_sort that takes an array and returns a sorted array. 
# It must use the bubble sort methodology (using #sort would be pretty pointless, wouldn’t it?).

def bubble_sort(arr)
    for i in 0...arr.length
        for j in 0...arr.length - 1 - i
            if arr[j] > arr[j + 1]
                temp = arr[j]
                arr[j] = arr[j + 1]
                arr[j + 1] = temp
            end
        end
    end
    return arr
end

p bubble_sort([4,3,78,2,0,2])
# => [0,2,2,3,4,78]