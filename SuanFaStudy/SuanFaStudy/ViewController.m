//
//  ViewController.m
//  SuanFaStudy
//
//  Created by shoule on 2018/7/30.
//  Copyright © 2018年 yqs. All rights reserved.
//

#import "ViewController.h"
#import "BinaryTreeNode.h"
@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *tempArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 100, 100, 100);
    [button addTarget:self action:@selector(creatRondomArray) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    button.backgroundColor  =  [UIColor redColor];
    

}
-(void)creatRondomArray{
    for (int j = 0; j<10; j++) {
        NSMutableArray *array = [NSMutableArray array];
        NSInteger count = arc4random()%10+10;
        NSInteger i = 0;
        while (i<=count) {
            NSInteger num = arc4random()%100;
            [array addObject:[NSNumber numberWithInteger:num]];
            i++;
        }
        [self sortArray:array];
    }
    
}
-(void)sortArray:(NSMutableArray *)array{
//    [self maoPaoSuanFa];
//    [self xuanZePaiXu];
//    [self kuaiSuPaiXu];
//    [self guiBingPaiXu];
//    [self chaRuPaiXu];
//    [self xiErPaiXu];
//    [self jiShuPaiXu];
//    [self duipaixu];
    [self treeSort:array];
}
-(void)treeSort:(NSMutableArray *)arr{
//    NSArray *arr = [NSArray arrayWithObjects:@(7),@(6),@(3),@(2),@(1),@(9),@(10),@(12),@(14),@(4),@(14), nil];
    BinaryTreeNode *tree = [BinaryTreeNode new];
    tree = [BinaryTreeNode createTreeWithValues:arr];
    
//    BinaryTreeNode *tree33 = [BinaryTreeNode invertBinaryTreeNot:tree];
    BinaryTreeNode *tree1 = [BinaryTreeNode treeNodeAtIndex:3 inTree:tree];
    NSLog(@"%@",tree1);
    
    NSMutableArray *orderArray = [NSMutableArray array];
    [BinaryTreeNode preOrderTraverseTree:tree handler:^(BinaryTreeNode *treeNode) {
        [orderArray addObject:@(treeNode.value)];
    }];
    NSLog(@"先序遍历结果：%@", [orderArray componentsJoinedByString:@","]);
    [BinaryTreeNode preOrderTraverseTree1:tree handler:^(BinaryTreeNode *treeNode) {
//        [orderArray addObject:@(treeNode.value)];
    }];
    NSLog(@"先序遍历结果：%@", [orderArray componentsJoinedByString:@","]);
    
    NSMutableArray *orderArray1 = [NSMutableArray array];
    [BinaryTreeNode inOrderTraverseTree:tree handler:^(BinaryTreeNode *treeNode) {
        
        [orderArray1 addObject:@(treeNode.value)];
        
    }];
    NSLog(@"中序遍历结果：%@", [orderArray1 componentsJoinedByString:@","]);
    
    
    NSMutableArray *orderArray2 = [NSMutableArray array];
    [BinaryTreeNode postOrderTraverseTree:tree handler:^(BinaryTreeNode *treeNode) {
        [orderArray2 addObject:@(treeNode.value)];
        
    }];
    NSLog(@"后序遍历结果：%@", [orderArray2 componentsJoinedByString:@","]);
    
    
    NSMutableArray *orderArray3 = [NSMutableArray array];
    [BinaryTreeNode levelTraverseTree:tree handler:^(BinaryTreeNode *treeNode) {
        [orderArray3 addObject:@(treeNode.value)];
        
    }];
    NSLog(@"层次遍历结果：%@", [orderArray3 componentsJoinedByString:@","]);
    
    
    

}

#pragma mark --冒泡算法
///冒泡算法是重复地走访过要排序的数列，一次比较两个元素，如果他们的顺序错误就把他们交换过来。走访数列的工作是重复地进行直到没有再需要交换，也就是说该数列已经排序完成。
-(void)maoPaoSuanFa{
    int array[10] = {55, 23, 93, 23, 4, 56, 1, 34, 11, 69};
    int num = sizeof(array)/sizeof(int);
    for (int i = 0; i <= num - 1; i++) {
        if (i+1>num) {
            return;
        }
        for (int j = i+1; j <= num - 1; j++) {
            if (array[j]>array[i]) {
                int temp = array[j];
                array[j] = array[i];
                array[i] = temp;
                
            }
        }
    }
//    NSLog(@"%@",array);
    
    
    
    
    


    for (int i = 0 ; i < num - 1; i++) {

        for (int j = 0 ; j < num - 1 - i; j++) {

            if (array[j] < array[j +1]) {

                int temp = array[j];

                array[j] = array[j+1];

                array[j+1] = temp;
            }

        }
    }

    for (int i = 0; i < num; i++) {

        printf("%d", array[i]);

        if (i == num - 1) {

            printf("\n");

        } else {

            printf(" ");
        }
    }
}
#pragma mark --选择排序
///选择排序的工作原理是每一次从待排序的数据元素中选出最小（或最大）的一个元素，存放在序列的起始位置，直到全部待排序的数据元素排完。
-(void)xuanZePaiXu{
    int array[10] = {55, 23, 93, 23, 4, 56, 1, 34, 11, 69};
    
    int num = sizeof(array)/sizeof(int);
    
    for (int i = 0; i < num - 1; i++) {
        
        for (int j = i + 1; j < num ; j++) {
            
            if (array[i] > array [j]) {
                
                int temp = array[i];
                
                array[i] = array[j];
                
                array[j] = temp;
            }
            
        }
    }
    
    for (int i = 0; i < num; i++) {
        
        printf("%d", array[i]);
        
        if (i == num - 1) {
            
            printf("\n");
            
        } else {
            
            printf(" ");
        }
    }

}
#pragma mark -- 快速排序算法
//1．先从数列中取出一个数作为基准数。
//2．分区过程，将比这个数大的数全放到它的右边，小于或等于它的数全放到它的左边。
//3．再对左右区间重复第二步，直到各区间只有一个数。
-(void)kuaiSuPaiXu{
    NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:@(55), @(23),@(59),@(93),@(23),@(4),@(56),@(1),@(34),@(69),@(47),nil];
    [self quickSortArray:array withLeftIndex:0 andRightIndex:array.count - 1];
    NSLog(@"%@",array);

}
- (void)quickSortArray:(NSMutableArray *)array withLeftIndex:(NSInteger)leftIndex andRightIndex:(NSInteger)rightIndex{
    
    if (leftIndex>=rightIndex) {
        return;
    }
    NSNumber *num = array[leftIndex];
    NSInteger left = leftIndex;
    NSInteger right = rightIndex;
    while (left < right) {

        if ([num integerValue] <= [array[left+1] integerValue]) {
//            NSNumber *num1 = array[right];
//            array[right] = array[left+1];
//            array[left+1] = num1;
            [array exchangeObjectAtIndex:right withObjectAtIndex:left+1];
            right--;
        }else{
//            NSNumber *num2 = array[left];
//            array[left] = array[left+1];
//            array[left+1] = num2;
            [array exchangeObjectAtIndex:left withObjectAtIndex:left+1];
            left++;
        }

//        if ([num integerValue] > [array[rightIndex] integerValue]) {
//            array[leftIndex] =  array[rightIndex];
//            array[leftIndex+1] = num;
//            leftIndex++;
//        }

    }
//    array[leftIndex] = num;
    NSLog(@"------------%ld",leftIndex);
    NSLog(@"------------%ld",rightIndex);
    NSLog(@"------------%ld",left);
    [self quickSortArray:array withLeftIndex:leftIndex andRightIndex:left-1];
    NSLog(@"++++++++++++%ld",leftIndex);
    NSLog(@"++++++++++++%ld",rightIndex);
    NSLog(@"++++++++++++%ld",left);
    [self quickSortArray:array withLeftIndex:left+1 andRightIndex:rightIndex];
}

//- (void)quickSortArray:(NSMutableArray *)array withLeftIndex:(NSInteger)leftIndex andRightIndex:(NSInteger)rightIndex{
//
//    if (leftIndex >= rightIndex) {//如果数组长度为0或1时返回
//        return ;
//    }
//
//    NSInteger i = leftIndex;
//    NSInteger j = rightIndex;
//    //记录比较基准数
//    NSInteger key = [array[i] integerValue];
//
//    while (i < j) {
//        /**** 首先从右边j开始查找比基准数小的值 ***/
//        while (i < j && [array[j] integerValue] >= key) {//如果比基准数大，继续查找
//            j--;
//        }
//        //如果比基准数小，则将查找到的小值调换到i的位置
//        array[i] = array[j];
//
//        /**** 当在右边查找到一个比基准数小的值时，就从i开始往后找比基准数大的值 ***/
//        while (i < j && [array[i] integerValue] <= key) {//如果比基准数小，继续查找
//            i++;
//        }
//        //如果比基准数大，则将查找到的大值调换到j的位置
//        array[j] = array[i];
//
//    }
//
//    //将基准数放到正确位置
//    array[i] = @(key);
//
//    /**** 递归排序 ***/
//    NSLog(@"------------%ld",leftIndex);
//    NSLog(@"------------%ld",rightIndex);
//    NSLog(@"------------%ld",i);
//
//    //排序基准数左边的
//    [self quickSortArray:array withLeftIndex:leftIndex andRightIndex:i - 1];
//    NSLog(@"++++++++++++%ld",leftIndex);
//    NSLog(@"++++++++++++%ld",rightIndex);
//    NSLog(@"++++++++++++%ld",i);
//    //排序基准数右边的
//    [self quickSortArray:array withLeftIndex:i + 1 andRightIndex:rightIndex];
//}
#pragma mark -- 归并排序
//归并排序的名字已经把它的中心思想表达出来了，回归再合并。既是将两个有序数组合并为一个数组
-(void)guiBingPaiXu{
    NSMutableArray *arr = [[NSMutableArray alloc] initWithObjects:@(55), @(29),@(93),@(23),@(4),@(56),@(1),@(34),@(69),nil];
    [self.tempArr removeAllObjects];
    [self mergeSortArray:arr lowIndex:0 highIndex:arr.count - 1];
    
    NSLog(@"%@",self.tempArr);
    NSLog(@"%@",arr);
//    了解归并排序的方法执行顺序，在 [self addNum:num];后面的方法会执行，遵循后进先出的原则，符合归并排序分成一个元素后进行合并的原则
//    [self addNum:1];
}
//-(void)addNum:(NSInteger)num{
//    if (num>10) {
////        NSLog(@"1111111111");
//        NSLog(@"---------%d",num);
//        return;
//    }
//    num++;
////    NSLog(@"2222222");
//    NSLog(@"+++++++++=%d",num);
//    [self addNum:num];
//    NSLog(@"===========%d",num);
////    NSLog(@"3333333");
//    [self addNum:num];
//}
- (void)mergeSortArray:(NSMutableArray *)array lowIndex:(NSInteger)lowIndex highIndex:(NSInteger)highIndex{
    
    if (lowIndex >= highIndex) {
        return;
    }
    NSInteger highIndex1 = (highIndex + lowIndex)/2;
    NSInteger lowIndex1 =  (highIndex + lowIndex)/2+1;
    
    [self mergeSortArray:array lowIndex:lowIndex highIndex:highIndex1];
    [self mergeSortArray:array lowIndex:lowIndex1 highIndex:highIndex];
    
    [self mergeArray:array lowIndex:lowIndex midIndex:highIndex1 highIndex:highIndex];
}
- (void)mergeArray:(NSMutableArray *)array lowIndex:(NSInteger)lowIndex midIndex:(NSInteger)midIndex highIndex:(NSInteger)highIndex
{
    for (NSInteger i = lowIndex; i <= highIndex; i ++) {
        self.tempArr[i] = array[i];
//        [self.tempArr addObject:array[i]];
    }
    NSInteger l = lowIndex;
    NSInteger m = midIndex+1;
    if (m > highIndex) {
        return;
    }
    for (NSInteger i = lowIndex; i <= highIndex; i++) {
        if (m>highIndex) {
            array[i] = self.tempArr[l];
            l++;
        }else if (l>midIndex){
            array[i] = self.tempArr[m];
            m++;
        }else{
            if ([self.tempArr[i] integerValue] > [self.tempArr[m] integerValue]) {
                array[i] = self.tempArr[m];
                m++;
            }else{
                array[i] = self.tempArr[l];
                l++;
            }
        }
        
        
        
    }
}








//- (void)mergeSortArray:(NSMutableArray *)array lowIndex:(NSInteger)lowIndex highIndex:(NSInteger)highIndex
//{
//     NSLog(@"---------");
//    if (lowIndex >= highIndex) {
//        NSLog(@"444444");
//        return;
//    }
//    NSInteger midIndex = lowIndex + (highIndex - lowIndex) / 2;
//    NSLog(@"11111");
//    [self mergeSortArray:array lowIndex:lowIndex highIndex:midIndex];
//    [self mergeSortArray:array lowIndex:midIndex + 1 highIndex:highIndex];
//    NSLog(@"333333");
//    [self mergeArray:array lowIndex:lowIndex midIndex:midIndex highIndex:highIndex];
//}

//- (void)mergeArray:(NSMutableArray *)array lowIndex:(NSInteger)lowIndex midIndex:(NSInteger)midIndex highIndex:(NSInteger)highIndex
//{
//    for (NSInteger i = lowIndex; i <= highIndex; i ++) {
//        self.tempArr[i] = array[i];
//    }
//    NSLog(@"222222");
//    NSInteger k = lowIndex;
//    NSInteger l = midIndex + 1;
//    for (NSInteger j = lowIndex; j <= highIndex; j ++) {
//        if (l > highIndex) {
//            array[j] = self.tempArr[k];
//            k++;
//        }else if (k > midIndex)
//        {
//            array[j] = self.tempArr[l];
//            l++;
//        }else if ([self.tempArr[k] integerValue] > [self.tempArr[l] integerValue])
//        {
//            array[j] = self.tempArr[l];
//            l++;
//        }else
//        {
//            array[j] = self.tempArr[k];
//            k++;
//        }
//    }
//
//}
-(NSMutableArray *)tempArr
{
    if (_tempArr == nil) {
        _tempArr = [NSMutableArray array];
    }
    return _tempArr;
}

#pragma mark -- 插入排序
//实现思路：
//
//　　1. 从第一个元素开始，认为该元素已经是排好序的。
//
//　　2. 取下一个元素，在已经排好序的元素序列中从后向前扫描。
//　　3. 如果已经排好序的序列中元素大于新元素，则将该元素往右移动一个位置。
//　　4. 重复步骤3，直到已排好序的元素小于或等于新元素。
//　　5. 在当前位置插入新元素。
//　　6. 重复步骤2。

-(void)chaRuPaiXu{
    NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:@(55), @(29),@(93),@(23),@(4),@(56),@(1),@(34),@(69),nil];
//    for (int i = 1; i<=array.count-1; i++) {
//        NSNumber* num = array[i];
//        for (int j = i-1; j>=0&&j<array.count-1 ; j--) {
//
//            if ([num integerValue]<[array[j] integerValue]) {
//
//                array[j+1] = array[j] ;
//                array[j]  = num;
//            }
//        }
//    }

    for (int i = 1; i<array.count; i++) {
        NSNumber *num = array[i];
        for (int j = i-1; j >= 0; j--) {
            if ([num integerValue] < [array[j] integerValue]) {
                
                array[j+1] = array[j];
                array[j] = num;
            }
        }
        NSLog(@"%@",array);
    }
    NSLog(@"%@",array);
}
#pragma mark - 希尔排序
//希尔排序是把记录按下标的一定增量分组，对每组使用直接插入排序算法排序；随着增量逐渐减少，每组包含的关键词越来越多，当增量减至1时，整个文件恰被分成一组，算法便终止。
- (void)xiErPaiXu
{
    NSMutableArray *ascendingArr = [[NSMutableArray alloc] initWithObjects:@(55), @(29),@(93),@(23),@(4),@(56),@(1),@(34),@(69),nil];
    NSInteger gap = ascendingArr.count/2;
    NSInteger number = 0;
    while (gap>=1) {
        for (int i = 0 ; i < ascendingArr.count-gap; i++) {
            NSNumber* num = ascendingArr[i];
            if (ascendingArr[i] > ascendingArr[i+gap]) {
                number++;
                ascendingArr[i] = ascendingArr[i+gap];
                ascendingArr[i+gap] = num;
            }

        }
        gap = gap/2;
    }

     NSLog(@"希尔升序排序结果：%@", ascendingArr);
    
    
    
    
    
//    NSMutableArray *buckt = [self createBucket];
//    NSNumber *maxnumber = [self listMaxItem:ascendingArr];
//    NSInteger maxLength = numberLength(maxnumber);
//    for (int digit = 1; digit <= maxLength; digit++) {
//        // 入桶
//        for (NSNumber *item in ascendingArr) {
//            NSInteger baseNumber = [self fetchBaseNumber:item digit:digit];
//            NSMutableArray *mutArray = buckt[baseNumber];
//            [mutArray addObject:item];
//        }
//        NSInteger index = 0;
//        for (int i = 0; i < buckt.count; i++) {
//            NSMutableArray *array = buckt[i];
//            while (array.count != 0) {
//                NSNumber *number = [array objectAtIndex:0];
//                ascendingArr[index] = number;
//                [array removeObjectAtIndex:0];
//                index++;
//            }
//        }
//    }
//    NSLog(@"希尔升序排序结果：%@", ascendingArr);
}


#pragma mark -- 基数排序
//判断数据在各位的大小，排列数据
//
//根据上一步的结果，判断数据在十分位的大小，排列数据。如果数据在这个位置的余数相同，那么数据之间的顺序根据上一轮的排列顺序确定
//
//依次类推，继续判断数据在百分位、千分位......上面的数据重新排序，直到所有的数据在某一分位上数据都为0
-(void)jiShuPaiXu{
    NSMutableArray *ascendingArr = [[NSMutableArray alloc] initWithObjects:@(55), @(29),@(93),@(23),@(4),@(56),@(1),@(34),@(69),nil];
    NSMutableArray*allArray = [NSMutableArray array];
    for (int index = 0; index < 10; index++) {
        NSMutableArray *array = [NSMutableArray array];
        [allArray addObject:array];
    }
    NSUInteger number = 0;
    for (NSNumber* num in ascendingArr) {
        if ([num integerValue]>number) {
            number = [num integerValue];
        }
    }
    NSString *string = [NSString stringWithFormat:@"%ld", number];

    NSInteger length = string.length;
    NSInteger currentLentg = 0;
    while (currentLentg < length) {
        for (int i = 0; i < ascendingArr.count; i++) {
            NSString *string = [NSString stringWithFormat:@"%ld", [ascendingArr[i] integerValue]];
            if (string.length-currentLentg >= 1 ) {
                string = [string substringWithRange:NSMakeRange(string.length-currentLentg-1, 1)];
               
            }else{
                string = @"0";
            }
            
            for (int j = 0; j < allArray.count; j++) {
                if (string.integerValue == j) {
                    NSMutableArray* array = allArray[j];
                    [array addObject:ascendingArr[i]];
                }
            }
            
        }
        NSInteger arrNum = 0;
        for (int j = 0; j < allArray.count; j++) {
            NSMutableArray*array = allArray[j];
            while (array.count>0) {
                ascendingArr[arrNum] = array[0];
                [array removeObjectAtIndex:0];
                arrNum++;
            }
        }
        currentLentg++;
        
    }
    
    NSLog(@"基数升序排序结果：%@", ascendingArr);
    

//    //长度为10对应0到9个数
//    NSMutableArray *buckt = [self createBucket];
//    //最大的数
//    NSNumber *maxnumber = [self listMaxItem:ascendingArr];
//    //获取最大数位数长度
//    NSInteger maxLength = numberLength(maxnumber);
//    for (int digit = 1; digit <= maxLength; digit++) {
//        // 入桶
//        for (NSNumber *item in ascendingArr) {
//            NSInteger baseNumber = [self fetchBaseNumber:item digit:digit];
//            NSMutableArray *mutArray = buckt[baseNumber];
//            [mutArray addObject:item];
//        }
//        NSInteger index = 0;
//        for (int i = 0; i < buckt.count; i++) {
//            NSMutableArray *array = buckt[i];
//            while (array.count != 0) {
//                NSNumber *number = [array objectAtIndex:0];
//                ascendingArr[index] = number;
//                [array removeObjectAtIndex:0];
//                index++;
//            }
//        }
//    }
//    NSLog(@"基数升序排序结果：%@", ascendingArr);
}
- (NSMutableArray *)createBucket {
    NSMutableArray *bucket = [NSMutableArray array];
    for (int index = 0; index < 10; index++) {
        NSMutableArray *array = [NSMutableArray array];
        [bucket addObject:array];
    }
    return bucket;
}

- (NSNumber *)listMaxItem:(NSArray *)list {
    NSNumber *maxNumber = list[0];
    for (NSNumber *number in list) {
        if ([maxNumber integerValue] < [number integerValue]) {
            maxNumber = number;
        }
    }
    return maxNumber;
}

NSInteger numberLength(NSNumber *number) {
    NSString *string = [NSString stringWithFormat:@"%ld", (long)[number integerValue]];
    return string.length;
}

- (NSInteger)fetchBaseNumber:(NSNumber *)number digit:(NSInteger)digit {
    if (digit > 0 && digit <= numberLength(number)) {
        NSMutableArray *numbersArray = [NSMutableArray array];
        NSString *string = [NSString stringWithFormat:@"%ld", [number integerValue]];
        for (int index = 0; index < numberLength(number); index++) {
            [numbersArray addObject:[string substringWithRange:NSMakeRange(index, 1)]];
        }
        NSString *str = numbersArray[numbersArray.count - digit];
        return [str integerValue];
    }
    return 0;
}

#pragma mark -- 堆排序
//堆排序比希尔排序更为高效，其时间复杂度为O(nlog2n)。下方的“堆排序”是根据大顶堆来进行排序的，大顶堆第一个值是序列中最大的，我们可以利用这一点获取无序序列中最大的那个值。首先我们将序列调整为大顶堆，然后把大顶堆的第一个值与最后一个值进行交换，然后再将剩下的序列调整成大顶堆，然后进行下一轮的替换。

- (void)duipaixu
{
    NSMutableArray *list = [[NSMutableArray alloc] initWithObjects:@(55), @(29),@(93),@(89),@(4),@(56),@(1),@(34),@(69),@(47),@(472),@(3),@(12),@(27),@(31),nil];
//    for (int i = 0; i <= list.count/2; i++){
//
//    }
//
//    NSLog(@"%@",list);
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    NSInteger i ,size;
    size = list.count;
    //找出最大的元素放到堆顶
    for (i= list.count/2; i>=0; i--) {
        [self createBiggesHeap:list withSize:size beIndex:i];
    }

    while(size > 0){
        [list exchangeObjectAtIndex:size-1 withObjectAtIndex:0]; //将根(最大) 与数组最末交换
        size -- ;//树大小每次减小一个元素
        [self createBiggesHeap:list withSize:size beIndex:0];
    }
    NSLog(@"%@",list);
}

- (void)createBiggesHeap:(NSMutableArray *)list withSize:(NSInteger) size beIndex:(NSInteger)element
{
    NSInteger lchild = element *2 + 1,rchild = lchild+1; //左右子树
    while (rchild < size) { //子树均在范围内
        if (list[element]>=list[lchild] && list[element]>=list[rchild]) return; //如果比左右子树都大，完成整理
        if (list[lchild] > list[rchild]) { //如果左边最大
            [list exchangeObjectAtIndex:element withObjectAtIndex:lchild]; //把左面的提到上面
            element = lchild; //循环时整理子树
        }else{//否则右面最大
            [list exchangeObjectAtIndex:element withObjectAtIndex:rchild];
            element = rchild;
        }
        //改变子树位置以后要重新计算改变过后的当前子树节点是否满足大于左右两边的子树
        lchild = element * 2 +1;
        rchild = lchild + 1; //重新计算子树位置
    }
    //只有左子树且子树大于自己
    if (lchild < size && list[lchild] > list[element]) {
        [list exchangeObjectAtIndex:lchild withObjectAtIndex:element];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
