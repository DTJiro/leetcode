package leetcode.editor.cn;

//给你一个会议时间安排的数组 intervals ，每个会议时间都会包括开始和结束的时间 intervals[i] = [starti, endi] ，返回 
//所需会议室的最小数量 。 
//
// 
//
// 示例 1： 
//
// 
//输入：intervals = [[0,30],[5,10],[15,20]]
//输出：2
// 
//
// 示例 2： 
//
// 
//输入：intervals = [[7,10],[2,4]]
//输出：1
// 
//
// 
//
// 提示： 
//
// 
// 1 <= intervals.length <= 10⁴ 
// 0 <= starti < endi <= 10⁶ 
// 
//
// Related Topics 贪心 数组 双指针 前缀和 排序 堆（优先队列） 👍 609 👎 0

import java.util.Arrays;
import java.util.PriorityQueue;

public class MeetingRoomsIi{
	public static void main(String[] args) {
		Solution solution = new MeetingRoomsIi().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
    public int minMeetingRooms(int[][] intervals) {
		int[] start = new int[intervals.length];
		int[] end = new int[intervals.length];
		for (int i = 0; i < intervals.length; i++) {
			start[i] = intervals[i][0];
			end[i] = intervals[i][1];
		}
		Arrays.sort(start);
		Arrays.sort(end);

		int a = 0;
		int b = 0;
		int count = 0;
		while (a < intervals.length) {
			if (start[a] >= end[b]) {
				count--;
				b++;
			}
			count++;
			a++;
		}
		return count;
	}
}
//leetcode submit region end(Prohibit modification and deletion)

}
