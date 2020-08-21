# House Robber
# 打家劫舍


## Description
You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed, the only constraint stopping you from robbing each of them is that adjacent houses have security system connected and it will automatically contact the police if two adjacent houses were broken into on the same night.

Given a list of non-negative integers representing the amount of money of each house, determine the maximum amount of money you can rob tonight without alerting the police.

## Description
你是一个专业的小偷，计划偷窃沿街的房屋。每间房内都藏有一定的现金，影响你偷窃的唯一制约因素就是相邻的房屋装有相互连通的防盗系统，如果两间相邻的房屋在同一晚上被小偷闯入，系统会自动报警。

给定一个代表每个房屋存放金额的非负整数数组，计算你 不触动警报装置的情况下 ，一夜之内能够偷窃到的最高金额。



## Example
### Example 1:
    Input: nums = [1,2,3,1]
    Output: 4
    Explanation: Rob house 1 (money = 1) and then rob house 3 (money = 3).
                Total amount you can rob = 1 + 3 = 4.

### Example 2:
    Input: nums = [2,7,9,3,1]
    Output: 12
    Explanation: Rob house 1 (money = 2), rob house 3 (money = 9) and rob house 5 (money = 1).
                Total amount you can rob = 2 + 9 + 1 = 12.


## 示例
### 示例 1：
    输入：[1,2,3,1]
    输出：4
    解释：偷窃 1 号房屋 (金额 = 1) ，然后偷窃 3 号房屋 (金额 = 3)。
         偷窃到的最高金额 = 1 + 3 = 4 。

### 示例 2：
    输入：[2,7,9,3,1]
    输出：12
    解释：偷窃 1 号房屋 (金额 = 2), 偷窃 3 号房屋 (金额 = 9)，接着偷窃 5 号房屋 (金额 = 1)。
         偷窃到的最高金额 = 2 + 9 + 1 = 12 。

## Constraints:
* 0 <= nums.length <= 100
* 0 <= nums[i] <= 400

## 提示:
* 0 <= nums.length <= 100
* 0 <= nums[i] <= 400

## Solution
### 动态规划
这是一道比较简单的动态规划的题目, 这里每个屋子的最大价值取决于前两个屋子的情况. 所以这里我们可以采用动态规划的方式来解决.


### Code

```java
    //T O(n)
    //S O(n)
    public int rob(int[] nums) {
        //特殊值判断
        if (nums == null || nums.length == 0) {
            return 0;
        }
        //获取当前数组长度
        //如果当前只有一家. 没得选择 幸运的就是这一家了
        int length = nums.length;
        if (length == 1) {
            return nums[0];
        }

        //定义dp数组
        //因为实际上每个屋子的总金额之和前两个屋子有关, 所以可以通过移动数组更新前两个屋子的总金额, 使得S为O(1)
        int[] dp = new int[length];

        //初始化特殊值的情况
        dp[0] = nums[0];
        dp[1] = Math.max(nums[0], nums[1]);

        //遍历剩下的情况
        for (int i = 2; i < length; i++) {
            //状态转移方程为 dp[i] = max(dp[i - 2] + num[1], dp[i - 1])
            //或者说尝试获取和不获取当前屋子的两张情况, 看下哪种情况收益更高
            dp[i] = Math.max(dp[i - 2] + nums[i], dp[i - 1]);
        }

        return dp[length - 1];
    }

```