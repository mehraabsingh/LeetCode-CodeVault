class Solution {
    func maxFrequencyElements(_ nums: [Int]) -> Int {
        var freq: [Int: Int] = [:]
        
        // Step 1: Count frequencies
        for num in nums {
            freq[num, default: 0] += 1
        }
        
        // Step 2: Find the maximum frequency
        guard let maxFreq = freq.values.max() else { return 0 }
        
        // Step 3: Sum up all counts equal to max frequency
        var result = 0
        for count in freq.values {
            if count == maxFreq {
                result += count
            }
        }
        
        return result
    }
}
