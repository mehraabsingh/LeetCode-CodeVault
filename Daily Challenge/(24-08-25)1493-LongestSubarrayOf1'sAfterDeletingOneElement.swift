class Solution {
    func longestSubarray(_ nums: [Int]) -> Int {
        var left = 0
        var zeros = 0
        var maxLength = 0
        
        for right in 0..<nums.count {
            if nums[right] == 0 {
                zeros += 1
            }
            
            while zeros > 1 {
                if nums[left] == 0 {
                    zeros -= 1
                }
                left += 1
            }
            
            // (right - left) because one element must be deleted
            maxLength = max(maxLength, right - left)
        }
        
        return maxLength
    }
}
