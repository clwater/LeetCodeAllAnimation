# Jump Game
# 跳跃游戏

## Description
Given an array of non-negative integers, you are initially positioned at the first index of the array.
Each element in the array represents your maximum jump length at that position.
Determine if you are able to reach the last index.

## Description
给定一个非负整数数组，你最初位于数组的第一个位置。
数组中的每个元素代表你在该位置可以跳跃的最大长度。
判断你是否能够到达最后一个位置。

## Example
###   Example 1:
    Input: nums = [2,3,1,1,4]
    Output: true
    Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last index.

### Example 2:
    Input: nums = [3,2,1,0,4]
    Output: false
    Explanation: You will always arrive at index 3 no matter what. Its maximum jump length is 0, which makes it impossible to reach the last index.

## 示例
### 示例 1:
    输入: [2,3,1,1,4]
    输出: true
    解释: 我们可以先跳 1 步，从位置 0 到达 位置 1, 然后再从位置 1 跳 3 步到达最后一个位置。

### 示例 2:
    输入: [3,2,1,0,4]
    输出: false
    解释: 无论怎样，你总会到达索引为 3 的位置。但该位置的最大跳跃长度是 0 ， 所以你永远不可能到达最后一个位置。

## Other
###   Constraints:
* 1 <= nums.length <= 3 * 10^4
* 0 <= nums[i][j] <= 10^5


## Solution
### 贪心
这里我们依次尝试每个位置能到达的最远长度, 判断最后是否可以到达结束的位置


## Code 

```java
    //T O(n)
    //S O(1)
    public boolean canJump(int[] nums) {
        //数组长度
        int n = nums.length;
        //当前最远部位置
        int end = 0;
        for (int i = 0; i < n; ++i) {
            //判断当前位置是否可以到达
            if (i <= end) {
                //更新结束位置
                end = Math.max(end, i + nums[i]);
                //判断当前最右侧位置是否到达结束位置
                if (end >= n - 1) {
                    return true;
                }
            }
        }
        return false;
    }

```