package leetcode.editor.cn;

//给定整数数组 nums 和整数 k，请返回数组中第 k 个最大的元素。 
//
// 请注意，你需要找的是数组排序后的第 k 个最大的元素，而不是第 k 个不同的元素。 
//
// 你必须设计并实现时间复杂度为 O(n) 的算法解决此问题。 
//
// 
//
// 示例 1: 
//
// 
//输入: [3,2,1,5,6,4], k = 2
//输出: 5
// 
//
// 示例 2: 
//
// 
//输入: [3,2,3,1,2,4,5,5,6], k = 4
//输出: 4 
//
// 
//
// 提示： 
//
// 
// 1 <= k <= nums.length <= 10⁵ 
// -10⁴ <= nums[i] <= 10⁴ 
// 
//
// Related Topics 数组 分治 快速选择 排序 堆（优先队列） 👍 2454 👎 0

import java.util.Arrays;
import java.util.PriorityQueue;

public class KthLargestElementInAnArray{
	public static void main(String[] args) {
		Solution solution = new KthLargestElementInAnArray().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
    public int findKthLargest(int[] nums, int k) {
		int n = nums.length;
		return a(nums, 0, n - 1, n - k);
	}

	int a(int[] nums, int l, int r, int k) {
		if (l == r) {
			return nums[k];
		}
		int x = nums[l];
		int i = l - 1;
		int j = r + 1;
		while (i < j) {
			do {
				i++;
			} while (nums[i] < x);
			do {
				j--;
			} while (nums[j] > x);
			if (i < j) {
				int t = nums[i];
				nums[i] = nums[j];
				nums[j] = t;
			}
		}
		if (k <= j) {
			return a(nums, l, j, k);
		} else {
			return a(nums, j + 1, r, k);
		}

	}
}
//leetcode submit region end(Prohibit modification and deletion)

}
