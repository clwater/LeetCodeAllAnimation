# Permutations II
# 全排列 II

## Description
Given a collection of numbers that might contain duplicates, return all possible unique permutations.


## Description
给定一个可包含重复数字的序列，返回所有不重复的全排列。


## Example
### Example 1:
    Input: [1,1,2]
    Output:
    [
    [1,1,2],
    [1,2,1],
    [2,1,1]
    ]

## 示例
### 示例 1:
    输入: [1,1,2]
    输出:
    [
    [1,1,2],
    [1,2,1],
    [2,1,1]
    ]

## Solution
### DFS+回溯+剪枝
我们可以针对上一道题目来优化这里, 我们需要处理重复的情况, 这里的话我们通过剪枝的方法来优化.

### Code

```java
    //定义返回的结果, 数组最大长度及ArrayList结构的数组情况
    private int N;
    private List<List<Integer>> result;
    private ArrayList<Integer> arrayNums;

    //T O(n∗n!)
    //S O(n)
    public List<List<Integer>> permuteUnique(int[] nums) {
        //初始化相关信息
        result = new ArrayList<>();
        N = nums.length;

        //将数组内容转变为ArrayList方便回溯
        arrayNums = new ArrayList<>();
        for (int num : nums) {
            arrayNums.add(num);
        }

        //从最开始的位置递归数组查看情况
        backtrack(0);

        return result;
    }

    private void backtrack(int index) {
        //判断递归结束情况
        if (index == N) {
            result.add(new ArrayList<>(arrayNums));
        }

        //通过set记录当前取值是否重复
        HashSet<Integer> set = new HashSet<>();
        for (int i = index; i < N; i++) {

            //如果当前取值已经出现则跳过此值
            if (set.contains(arrayNums.get(i))) {
                continue;
            }
            set.add(arrayNums.get(i));

            //交换相应的位置
            Collections.swap(arrayNums, index, i);
            // 递归填充下一位数
            backtrack(index + 1);
            //再次交换相应的位置, 达到回溯的目的
            Collections.swap(arrayNums, index, i);

        }
    }
```