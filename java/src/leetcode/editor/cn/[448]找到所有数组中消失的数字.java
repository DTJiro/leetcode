package leetcode.editor.cn;

//给你一个含 n 个整数的数组 nums ，其中 nums[i] 在区间 [1, n] 内。请你找出所有在 [1, n] 范围内但没有出现在 nums 中的数
//字，并以数组的形式返回结果。 
//
// 
//
// 示例 1： 
//
// 
//输入：nums = [4,3,2,7,8,2,3,1]
//输出：[5,6]
// 
//
// 示例 2： 
//
// 
//输入：nums = [1,1]
//输出：[2]
// 
//
// 
//
// 提示： 
//
// 
// n == nums.length 
// 1 <= n <= 10⁵ 
// 1 <= nums[i] <= n 
// 
//
// 进阶：你能在不使用额外空间且时间复杂度为 O(n) 的情况下解决这个问题吗? 你可以假定返回的数组不算在额外空间内。 
//
// Related Topics 数组 哈希表 👍 1325 👎 0

import java.util.ArrayList;
import java.util.HashSet;

public class FindAllNumbersDisappearedInAnArray{
	public static void main(String[] args) {
		Solution solution = new FindAllNumbersDisappearedInAnArray().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
    public List<Integer> findDisappearedNumbers(int[] nums) {
		List<Integer> list = new ArrayList<>();
		int length = nums.length;
		for(int i = 0; i < length; i++){
			int num = Math.abs(nums[i]); //由于数组的元素有可能被*-1，所以取绝对值
			int index = num - 1;
			if(nums[index] > 0){
				nums[index] *= -1;
			}
		}
		for (int i = 0; i < length; i++) {
			if (nums[i] > 0) {
				list.add(i + 1);
			}
		}
		return list;
    }
}
//leetcode submit region end(Prohibit modification and deletion)

}
