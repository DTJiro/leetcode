package leetcode.editor.cn;

//给你一个按照非递减顺序排列的整数数组 nums，和一个目标值 target。请你找出给定目标值在数组中的开始位置和结束位置。 
//
// 如果数组中不存在目标值 target，返回 [-1, -1]。 
//
// 你必须设计并实现时间复杂度为 O(log n) 的算法解决此问题。 
//
// 
//
// 示例 1： 
//
// 
//输入：nums = [5,7,7,8,8,10], target = 8
//输出：[3,4] 
//
// 示例 2： 
//
// 
//输入：nums = [5,7,7,8,8,10], target = 6
//输出：[-1,-1] 
//
// 示例 3： 
//
// 
//输入：nums = [], target = 0
//输出：[-1,-1] 
//
// 
//
// 提示： 
//
// 
// 0 <= nums.length <= 10⁵ 
// -10⁹ <= nums[i] <= 10⁹ 
// nums 是一个非递减数组 
// -10⁹ <= target <= 10⁹ 
// 
//
// Related Topics 数组 二分查找 👍 2564 👎 0

public class FindFirstAndLastPositionOfElementInSortedArray{
	public static void main(String[] args) {
		Solution solution = new FindFirstAndLastPositionOfElementInSortedArray().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
    public int[] searchRange(int[] nums, int target) {
		int i = 0;
		int j = nums.length;
		int m = 0;
		int start = -1;
		int end = -1;
		while (i < j) {
			m = i + (j - i) / 2;
			if (target <= nums[m]) {
				j = m;
			} else {
				i = m + 1;
			}
		}
		start = i < 0 || i >= nums.length || target != nums[i] ? -1 : i;
		i = 0;
		j = nums.length;
		while (i < j) {
			m = i + (j - i) / 2;
			if (nums[m] <= target) {
				i = m + 1;
			} else {
				j = m;
			}
		}
		end = i - 1 >= 0 && i <= nums.length && nums[i - 1] == target ? i - 1 : -1;
		return new int[]{start, end};
    }
}
//leetcode submit region end(Prohibit modification and deletion)

}
