class Solution {
    func maxDistinctElements(_ nums: [Int], _ k: Int) -> Int {
        let nums = nums.sorted()
        var count = 0
        var lastUsed = Int.min
        
        for x in nums {
            let low = x - k
            let high = x + k
            // smallest available number > lastUsed
            if high >= lastUsed + 1 {
                let newVal = max(low, lastUsed + 1)
                lastUsed = newVal
                count += 1
            }
        }
        
        return count
    }
}
