#include <stdio.h>

int main()
{
	int i,j;
	long sum = 0; // Initialize sum
	long x1, x2, x3, x4, x5;
	
    // แก้ไข Loop Hazard โดยใช้ Loop Unrolling (คลี่ลูป)
    // ลดจำนวนครั้งที่ต้องเช็คเงื่อนไข (Branch) และลด Data Dependency ใน Loop

	for (i=0;i<10;i++){
        // Loop เดิมวน 10 รอบ -> คลี่ออกมาทำทีละ 5 รอบ (วนแค่ 2 รอบใหญ่)
		for(j=0; j<10; j+=5){
            // รอบที่ 1 (j)
			x1 = i + j;
            // รอบที่ 2 (j+1)
			x2 = i + (j+1);
            // รอบที่ 3 (j+2)
            x3 = i + (j+2);
            // รอบที่ 4 (j+3)
            x4 = i + (j+3);
            // รอบที่ 5 (j+4)
            x5 = i + (j+4);
            
            // นำผลรวมมารวมทีเดียว ลดการอัปเดต sum ถี่เกินไป (Accumulator Hazard)
			sum = sum + x1 + x2 + x3 + x4 + x5;
		}
	}
	printf("%ld\n",sum);
}
