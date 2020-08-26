# Shuffle an Array
# 打乱数组

## Description
Shuffle a set of numbers without duplicates.

## Description
打乱一个没有重复元素的数组。

## Example
### Example:
    // Init an array with set 1, 2, and 3.
    int[] nums = {1,2,3};
    Solution solution = new Solution(nums);
    
    // Shuffle the array [1,2,3] and return its result. Any permutation of [1,2,3] must equally likely to be returned.
    solution.shuffle();
    
    // Resets the array back to its original configuration [1,2,3].
    solution.reset();
    
    // Returns the random shuffling of array [1,2,3].
    solution.shuffle();

## 示例
###   示例:
    // 以数字集合 1, 2 和 3 初始化数组。
    int[] nums = {1,2,3};
    Solution solution = new Solution(nums);
    
    // 打乱数组 [1,2,3] 并返回结果。任何 [1,2,3]的排列返回的概率应该相同。
    solution.shuffle();
    
    // 重设数组到它的初始状态[1,2,3]。
    solution.reset();
    
    // 随机返回数组[1,2,3]打乱后的结果。
    solution.shuffle();


## Solution
### 洗牌算法
这个问题我们可以理解为洗牌问题, 对于洗牌问题,Fisher-Yates洗牌算法即是通俗解法.同时也是渐进最优的解法.


## Code 

```java
//T O(n)
    //S O(n)
    class Solution {

        //当前操作数组
        private int[] array;

        //初始数组(未洗牌)
        private int[] original;



        //构造函数
        //初始化两个数组
        public Solution(int[] nums) {
            array = nums;
            original = nums.clone();
        }

        //重置数组为未洗牌状态
        public int[] reset() {
            array = original;
            original = original.clone();
            return original;
        }

        //洗牌操作
        public int[] shuffle() {
            //遍历每个位置, 将其随机与剩下的某个位置交换内容
            for (int i = 0; i < array.length; i++) {
                changeArr(i, rand(i, array.length));
            }
            return array;
        }


        Random random = new Random();

        //生成随机位置
        private int rand(int min, int max) {
            return random.nextInt(max - min) + min;
        }

        //交换两个元素位置
        private void changeArr(int i, int j) {
            int temp = array[i];
            array[i] = array[j];
            array[j] = temp;
        }

    }
```