# Longest Repeating Character Replacement
# 递增子序列


## Description
Given an integer array, your task is to find all the different possible increasing subsequences of the given array, and the length of an increasing subsequence should be at least 2.

## Description
给定一个整型数组, 你的任务是找到所有该数组的递增子序列，递增子序列的长度至少是2。





## Example
    Input: [4, 6, 7, 7]
    Output: [[4, 6], [4, 7], [4, 6, 7], [4, 6, 7, 7], [6, 7], [6, 7, 7], [7,7], [4,7,7]] 

## 示例
    输入: [4, 6, 7, 7]
    输出: [[4, 6], [4, 7], [4, 6, 7], [4, 6, 7, 7], [6, 7], [6, 7, 7], [7,7], [4,7,7]]


### Note:
* The length of the given array will not exceed 15.
* The range of integer in the given array is [-100,100].
* The given array may contain duplicates, and two equal integers should also be considered as a special case of increasing sequence.

## 注意
1. 给定数组的长度不会超过15。
2. 数组中的整数范围是 [-100,100]。
3. 给定数组中可能包含重复数字，相等的数字应该被视为递增的一种情况。


## Solution
### DFS
这也是一道很典型的树的DFS遍历的题目, 这里我们需要注意规避重复的数据情况

### Code

```java
    //定义结果集, 通过set避免重复序列
    private Set<List<Integer>> result = new HashSet<>();
    private int[] nums;

    //T O(2^n)
    //S O(n)
    public List<List<Integer>> findSubsequences(int[] nums) {
        this.nums = nums;
        //深度优先遍历树
        dfs(new ArrayList<>(), 0);
        return new ArrayList(result);
    }

    private void dfs(List<Integer> cur, int start) {
        //如果当前子序列长度超过2, 则加入结果集中
        if (cur.size() >= 2) {
            result.add(new ArrayList<>(cur));
        }

        //遍历剩余数字, 查看能否加入到序列中
        for (int i = start; i < nums.length; i++) {
            //如果当前子序列为空, 或者插入的数字不小于当前序列末尾数字, 则加入到子序列中
            if (cur.size() == 0 || cur.get(cur.size() - 1) <= nums[i]) {
                cur.add(nums[i]);
                dfs(cur, i + 1);
                cur.remove(cur.size() - 1);
            }
        }
    }
```