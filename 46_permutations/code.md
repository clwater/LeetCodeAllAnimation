# Permutations
# 全排列

## Description
Given a collection of distinct integers, return all possible permutations.


## Description
给定一个 没有重复 数字的序列，返回其所有可能的全排列。


## Example
### Example 1:
    Input: [1,2,3]
    Output:
    [
    [1,2,3],
    [1,3,2],
    [2,1,3],
    [2,3,1],
    [3,1,2],
    [3,2,1]
    ]

## 示例
### 示例 1:
    输入: [1,2,3]
    输出:
    [
    [1,2,3],
    [1,3,2],
    [2,1,3],
    [2,3,1],
    [3,1,2],
    [3,2,1]
    ]

## Solution
### DFS+回溯
针对这样的需要遍历的情况, 我们可以通过对树的深度遍历和状态回溯的方式来解决.

### Code

```java
    //定义返回的结果, 数组最大长度及ArrayList结构的数组情况
    private int N;
    private List<List<Integer>> result;
    private ArrayList<Integer> arrayNums;

    //T O(n∗n!)
    //S O(n)
    public List<List<Integer>> permute(int[] nums) {
        //初始化相关信息
        result = new ArrayList<>();
        N = nums.length;

        //将数组内容转变为ArrayList方便回溯
        arrayNums = new ArrayList<>();
        for (int num : nums) {
            arrayNums.add(num);
        }
        //从最开始的位置递归数组查看情况
        dfs(0);

        return result;
    }

    private void dfs(int index) {
        //判断递归结束情况
        if (index == N) {
            result.add(new ArrayList<>(arrayNums));
        }
        for (int i = index; i < N; i++) {
            //交换相应的位置
            Collections.swap(arrayNums, index, i);
            // 递归填充下一位数
            dfs(index + 1);
            //再次交换相应的位置, 达到回溯的目的
            Collections.swap(arrayNums, index, i);

        }
    }

```