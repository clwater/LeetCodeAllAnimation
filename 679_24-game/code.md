# 24 Game

## Description
You have 4 cards each containing a number from 1 to 9. You need to judge whether they could operated through *, /, +, -, (, ) to get the value of 24.

## Description
你有 4 张写有 1 到 9 数字的牌。你需要判断是否能通过 *，/，+，-，(，) 的运算得到 24。


## Example
### Example 1:
    Input: [4, 1, 8, 7]
    Output: True
    Explanation: (8-4) * (7-1) = 24

### Example 2:
    Input: [1, 2, 1, 2]
    Output: False


## 样例
### 样例  1:
	输入: [4, 1, 8, 7]
    输出: True
    解释: (8-4) * (7-1) = 24

### 样例 2:
	输入: [1, 2, 1, 2]
    输出: False       

## Note
1. The division operator / represents real division, not integer division. For example, 4 / (1 - 2/3) = 12.
2. Every operation done is between two numbers. In particular, we cannot use - as a unary operator. For example, with [1, 1, 1, 1] as input, the expression -1 - 1 - 1 - 1 is not allowed.
3. You cannot concatenate numbers together. For example, if the input is [1, 2, 1, 2], we cannot write this as 12 + 12.        

## 注意

1. 除法运算符 / 表示实数除法，而不是整数除法。例如 4 / (1 - 2/3) = 12 。
2. 每个运算符对两个数进行运算。特别是我们不能用 - 作为一元运算符。例如，[1, 1, 1, 1] 作为输入时，表达式 -1 - 1 - 1 - 1 是不允许的。
3. 你不能将数字连接在一起。例如，输入为 [1, 2, 1, 2] 时，不能写成 12 + 12 。


## Solution

### 回溯法(DFS)
这道题目的话我们可以通过回溯法来解答, 我们可以看到其实这个题目的所有的情况是有限的, 这里我们可以将每次操作作为树的节点, 针对每个+-*/的情况分别处理,这里采用的是DFS的方法来遍历相关情况, 当我们发现某个分支结果不能符合的时候,则回到其父节点来继续处理下一种情况.      

### Code

```java
  //T O(1)
    //S O(1)
    public boolean judgePoint24(int[] nums) {
        ArrayList<Double> A = new ArrayList<>();
        for (int v : nums) {
            A.add((double) v);
        }
        return solve(A);
    }

    private boolean solve(ArrayList<Double> nums) {
        // 没有可计算的，证明无解
        if (nums.size() == 0) {
            return false;
        }
        // le-6是浮点计算的精度误差
        //判断当前结果是否为24
        if (nums.size() == 1){
            return Math.abs(nums.get(0) - 24) < 1e-6;
        }

        // 找到当前排列下的其他两个元素
        for (int i = 0; i < nums.size(); i++) {
            for (int j = 0; j < nums.size(); j++) {
                if (i != j) {
                    //获取剩下未选择的数字
                    ArrayList<Double> nums2 = new ArrayList<>();
                    for (int k = 0; k < nums.size(); k++) {
                        if (k != i && k != j) {
                            nums2.add(nums.get(k));
                        }
                    }

                    // k的四种计算情况
                    for (int k = 0; k < 4; k++) {
                        // 性能优化，当k<2时，对于+ or *不考虑顺序，
                        // 所以k<2 时，j > i与i > j的结果相同，所以有部分不用考虑
                        if (k < 2 && j > i) {
                            continue;
                        }
                        if (k == 0) {
                            nums2.add(nums.get(i) + nums.get(j));
                        }
                        if (k == 1) {
                            nums2.add(nums.get(i) * nums.get(j));
                        }
                        if (k == 2) {
                            nums2.add(nums.get(i) - nums.get(j));
                        }
                        // 避免除数为0
                        if (k == 3) {
                            if (nums.get(j) != 0) {
                                nums2.add(nums.get(i) / nums.get(j));
                            } else {
                                continue;
                            }
                        }
                        // 在这次计算后，判断剩下的元素是否符合要求
                        // 每次缩小计算范围
                        if (solve(nums2)) {
                            return true;
                        }
                        //回溯 移除最后一种不符合的情况
                        nums2.remove(nums2.size() - 1);
                    }
                }
            }
        }
        return false;
    }
```