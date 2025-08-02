class Solution {
    func minCost(_ basket1: [Int], _ basket2: [Int]) -> Int {
        var freq = [Int: Int]()
        
        for fruit in basket1 {
            freq[fruit, default: 0] += 1
        }
        for fruit in basket2 {
            freq[fruit, default: 0] -= 1
        }
        
        var extra = [Int]()
        
        for (fruit, count) in freq {
            if count % 2 != 0 {
                return -1
            }
            for _ in 0..<abs(count)/2 {
                extra.append(fruit)
            }
        }
        
        extra.sort()
        
        let minFruit = min(basket1.min()!, basket2.min()!)
        var result = 0
        
        for i in 0..<extra.count / 2 {
            result += min(extra[i], 2 * minFruit)
        }
        
        return result
    }
}
