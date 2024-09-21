define i32 @main() #0 {
  ;声明变量float a;int b;
  %1 = alloca float, align 4
  %2 = alloca i32, align 4
  ;scanf("%f",&a);
  %3 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), float* %1)
  %4 = load float, float* %1, align 4
  ;隐式类型转换
  %5 = fptosi float %4 to i32
  ;b=a;
  store i32 %5, i32* %2, align 4
  ;printf("%d",b); 
  %6 = load i32, i32* %2, align 4
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i32 %6)
  ;return 0;
  ret i32 0
}
; 函数声明
declare dso_local i32 @__isoc99_scanf(i8*, ...) #1
declare dso_local i32 @printf(i8*, ...) #1
@.str = private unnamed_addr constant [3 x i8] c"%f\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1