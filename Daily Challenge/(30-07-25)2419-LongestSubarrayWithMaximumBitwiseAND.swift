class Solution {
    func longestSubarray(_ nums: [Int]) -> Int {
        guard let maxVal = nums.max() else { return 0 }

        var maxLength = 0
        var currentLength = 0

        for num in nums {
            if num == maxVal {
                currentLength += 1
                maxLength = max(maxLength, currentLength)
            } else {
                currentLength = 0
            }
        }

        return maxLength
    }
}
