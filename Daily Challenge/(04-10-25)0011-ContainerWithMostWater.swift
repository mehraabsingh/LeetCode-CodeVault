class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var left = 0
        var right = height.count - 1
        var maxArea = 0
        
        while left < right {
            // Calculate current area
            let h = min(height[left], height[right])
            let width = right - left
            let area = h * width
            
            // Update max area
            maxArea = max(maxArea, area)
            
            // Move the pointer with smaller height
            if height[left] < height[right] {
                left += 1
            } else {
                right -= 1
            }
        }
        
        return maxArea
    }
}
