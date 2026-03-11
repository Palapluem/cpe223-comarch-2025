#include <stdio.h>

int main()
{
	int a;
	int b[] = {80,70,60,50};
	// int *c; // ไม่ได้ใช้ pointer *c เพื่อลด complexity
    // c=b+2;

	scanf("%d",&a);

    // แก้ไข Control Hazard โดยลดความซับซ้อนของเงื่อนไข (Code Optimization)
    // และจัดเรียงเงื่อนไขที่ "น่าจะเป็นจริงบ่อยที่สุด" ไว้บนสุด (Manual Prediction)
    
    // สมมติว่าคะแนนส่วนใหญ่ผ่าน (A, B, C, D) เราย้ายมาเช็คก่อน
    if (a >= 0 && a <= 100) {
        if(a > 80) printf("A\n");
        else if(a > b[1]) printf("B\n"); 
        // else if(a > *c) printf("C\n"); // *c คือ b[2] = 60
        else if(a > 60) printf("C\n");
        else if(a >= b[3]) printf("D\n"); // b[3] คือ 50
        else printf("F\n");
    } else {
        // กรณี Error (น้อยมากที่จะเกิด) เอาไว้ท้ายสุด
        // ช่วยให้ Branch Prediction ทายถูกง่ายขึ้นว่า "มักจะเข้า if แรกเสมอ"
        printf("Error\n"); 
    }
	
	return 0;
}
