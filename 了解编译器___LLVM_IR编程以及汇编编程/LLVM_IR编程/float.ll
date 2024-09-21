define i32 @main() #0 {
  ; 声明变量:float a,b,add,sub,mul,div;
  %1 = alloca float, align 4    
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  %5 = alloca float, align 4
  %6 = alloca float, align 4
  ; scanf("%f%f",&a,&b);
  %7 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), float* %1, float* %2)
  ; add=a+b;
  %8 = load float, float* %1, align 4
  %9 = load float, float* %2, align 4
  %10 = fadd float %8, %9
  store float %10, float* %3, align 4
  ; sub=a-b;
  %11 = load float, float* %1, align 4
  %12 = load float, float* %2, align 4
  %13 = fsub float %11, %12
  store float %13, float* %4, align 4
  ; mul=a*b;
  %14 = load float, float* %1, align 4
  %15 = load float, float* %2, align 4
  %16 = fmul float %14, %15
  store float %16, float* %5, align 4
  ; div=a/b;
  %17 = load float, float* %1, align 4
  %18 = load float, float* %2, align 4
  %19 = fdiv float %17, %18
  store float %19, float* %6, align 4
  ; printf("%.2f %.2f %.2f %.2f",add,sub,mul,div);在C语言中printf会自动将float转为double，在LLVM IR中要手动进行
  %20 = load float, float* %3, align 4
  %21 = fpext float %20 to double
  %22 = load float, float* %4, align 4
  %23 = fpext float %22 to double
  %24 = load float, float* %5, align 4
  %25 = fpext float %24 to double
  %26 = load float, float* %6, align 4
  %27 = fpext float %26 to double
  %28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.1, i64 0, i64 0), double %21, double %23, double %25, double %27)
  ret i32 0
}
; 函数声明
declare dso_local i32 @__isoc99_scanf(i8*, ...) #1
declare dso_local i32 @printf(i8*, ...) #1
@.str = private unnamed_addr constant [5 x i8] c"%f%f\00", align 1
@.str.1 = private unnamed_addr constant [20 x i8] c"%.2f %.2f %.2f %.2f\00", align 1
