#Implement a method #stock_picker that takes in an array of stock prices, one for each hypothetical day. 
#It should return a pair of days representing the best day to buy and the best day to sell. Days start at 0.

def stock_picker(prices)
    left = 0
    right = 1
    maxP = 0
    res = []
    while right < prices.length
        if prices[right] > prices[left]
            if prices[right] - prices[left] > maxP
                res = [left, right]
            end
            maxP = [maxP, prices[right] - prices[left]].max
        else
            left = right
        end
        right += 1
    end
    return res
end

p stock_picker([17,3,6,9,15,8,6,1,10])
#  => [1,4]  # for a profit of $15 - $3 == $12