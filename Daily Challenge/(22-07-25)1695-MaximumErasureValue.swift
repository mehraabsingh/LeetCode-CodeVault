class Solution {
    func maximumUniqueSubarray(_ nums: [Int]) -> Int {
        var seen = Set<Int>()
        var left = 0
        var currentSum = 0
        var maxSum = 0
        
        for right in 0..<nums.count {
            while seen.contains(nums[right]) {
                seen.remove(nums[left])
                currentSum -= nums[left]
                left += 1
            }
            seen.insert(nums[right])
            currentSum += nums[right]
            maxSum = max(maxSum, currentSum)
        }
        
        return maxSum
    }
}
