# Lab 6: Multiplication Algorithms

## 1. Bit-pair Recoding (อ้างอิงจากรูปแรก)
$$
\begin{array}{c}
\begin{array}{l}
\textbf{พิจารณา } -4 \times 5 \\
\\
\begin{array}{cc@{\qquad\xrightarrow{\hspace{1.5cm}}\qquad}c}
\begin{array}{rrrrrl}
   & 1 & 1 & 0 & 0 & \text{(-4)} \\
\times & 0 & 1 & 0 & 1 & \text{(+5)} \\
\hline
\end{array}
& &
\begin{array}{rrrrrl}
   & 1 & 1 & 0 & 0 & \\
   & \text{+1} & & \text{+1} & & \\
\hline
\color{red}1\ \ \ \ \ \ \color{red}1\ \ \ \ \ \ \color{red}1\ \ \ \ \ \ \color{red}1 & \color{blue}1 & \color{blue}1 & \color{blue}0 & \color{blue}0 & \\
\color{red}1\ \ \ \ \ \ \color{red}1\ \ \ \ \ \ \color{blue}1\ \ \ \ \ \ \color{blue}1 & \color{blue}0 & \color{blue}0 & & & \\
\hline
\color{blue}1\ \ \ \ \ \ \color{blue}1\ \ \ \ \ \ \color{blue}1\ \ \ \ \ \ \color{blue}0 & \color{blue}1 & \color{blue}1 & \color{blue}0 & \color{blue}0 & \text{(-20)}
\end{array}
\end{array}
\\
\\
\textbf{พิจารณา } 5 \times -4 \\
\\
\begin{array}{cc@{\qquad\xrightarrow{\hspace{1.5cm}}\qquad}c}
\begin{array}{rrrrrl}
   & 0 & 1 & 0 & 1 & \text{(+5)} \\
\times & 1 & 1 & 0 & 0 & \text{(-4)} \\
\hline
\end{array}
& &
\begin{array}{rrrrrl}
   & 0 & 1 & 0 & 1 & \\
   & \text{-1} & & \text{0} & & \\
\hline
\color{red}0\ \ \ \ \ \ \color{red}0\ \ \ \ \ \ \color{red}0\ \ \ \ \ \ \color{red}0 & \color{blue}0 & \color{blue}0 & \color{blue}0 & \color{blue}0 & \\
\color{red}1\ \ \ \ \ \ \color{red}1\ \ \ \ \ \ \color{blue}1\ \ \ \ \ \ \color{blue}0 & \color{blue}1 & \color{blue}1 & & & \\
\hline
\color{blue}1\ \ \ \ \ \ \color{blue}1\ \ \ \ \ \ \color{blue}1\ \ \ \ \ \ \color{blue}0 & \color{blue}1 & \color{blue}1 & \color{blue}0 & \color{blue}0 & \text{(-20)}
\end{array}
\end{array}
\end{array}
\end{array}
$$

---

## 2. Booth's Algorithm (อ้างอิงจากรูปที่สอง)
$$
\begin{array}{c}
\begin{array}{l}
\textbf{พิจารณา } -4 \times 5 \\
\\
\begin{array}{cc@{\qquad\xrightarrow{\hspace{1.5cm}}\qquad}c}
\begin{array}{rrrrrl}
   & 1 & 1 & 0 & 0 & \text{(-4)} \\
\times & 0 & 1 & 0 & 1 & \text{(+5)} \\
\hline
\end{array}
& &
\begin{array}{rrrrrl}
   & 1 & 1 & 0 & 0 & \\
   & \text{+1}\ \ \ \ \text{-1} & \text{+1}\ \ \ \ \text{-1} & & & \\
\hline
\color{red}0\ \ \ \ \ \ \color{red}0\ \ \ \ \ \ \color{red}0\ \ \ \ \ \ \color{red}0 & \color{blue}0 & \color{blue}1 & \color{blue}0 & \color{blue}0 & \\
\color{red}1\ \ \ \ \ \ \color{red}1\ \ \ \ \ \ \color{red}1\ \ \ \ \ \ \color{blue}1 & \color{blue}1 & \color{blue}0 & \color{blue}0 & & \\
\color{red}0\ \ \ \ \ \ \color{red}0\ \ \ \ \ \ \color{blue}0\ \ \ \ \ \ \color{blue}1 & \color{blue}0 & \color{blue}0 & & & \\
\color{red}1\ \ \ \ \ \ \color{blue}1\ \ \ \ \ \ \color{blue}1\ \ \ \ \ \ \color{blue}0 & \color{blue}0 & & & & \\
\hline
\color{blue}1\ \ \ \ \ \ \color{blue}1\ \ \ \ \ \ \color{blue}1\ \ \ \ \ \ \color{blue}0 & \color{blue}1 & \color{blue}1 & \color{blue}0 & \color{blue}0 & \text{(-20)}
\end{array}
\end{array}
\\
\\
\textbf{พิจารณา } 5 \times -4 \\
\\
\begin{array}{cc@{\qquad\xrightarrow{\hspace{1.5cm}}\qquad}c}
\begin{array}{rrrrrl}
   & 0 & 1 & 0 & 1 & \text{(+5)} \\
\times & 1 & 1 & 0 & 0 & \text{(-4)} \\
\hline
\end{array}
& &
\begin{array}{rrrrrl}
   & 0 & 1 & 0 & 1 & \\
   & \text{0}\ \ \ \ \text{-1} & \text{0}\ \ \ \ \text{0} & & & \\
\hline
\color{red}0\ \ \ \ \ \ \color{red}0\ \ \ \ \ \ \color{red}0\ \ \ \ \ \ \color{red}0 & \color{blue}0 & \color{blue}0 & \color{blue}0 & \color{blue}0 & \\
\color{red}0\ \ \ \ \ \ \color{red}0\ \ \ \ \ \ \color{red}0\ \ \ \ \ \ \color{blue}0 & \color{blue}0 & \color{blue}0 & \color{blue}0 & & \\
\color{red}1\ \ \ \ \ \ \color{red}1\ \ \ \ \ \ \color{blue}1\ \ \ \ \ \ \color{blue}0 & \color{blue}1 & \color{blue}1 & & & \\
\color{red}0\ \ \ \ \ \ \color{blue}0\ \ \ \ \ \ \color{blue}0\ \ \ \ \ \ \color{blue}0 & \color{blue}0 & & & & \\
\hline
\color{blue}1\ \ \ \ \ \ \color{blue}1\ \ \ \ \ \ \color{blue}1\ \ \ \ \ \ \color{blue}0 & \color{blue}1 & \color{blue}1 & \color{blue}0 & \color{blue}0 & \text{(-20)}
\end{array}
\end{array}
\end{array}
\end{array}
$$

---

## 3. Discussion (การอภิปรายเปรียบเทียบ)

### ประสิทธิภาพของ Booth's Algorithm (Regular)
รูปแบบของการคำนวณขึ้นอยู่กับความต่อเนื่องของบิต `1` หรือ `0` ในหลักของตัวคูณ:
- ในกรณี `-4 * 5` ตัวคูณคือ `0101` บิตมีการสลับไปมาระหว่าง 0 กับ 1 อย่างต่อเนื่อง ทำให้ระบบต้องทำปฏิบัติการ บวก/ลบ (Add/Sub) ครบทั้ง 4 บรรทัด (4 Cycles) อย่างหลีกเลี่ยงไม่ได้ ซึ่งใช้เวลาในการประมวลผลมากและเกิด Partial Products จำนวนมาก
- ในกรณี `5 * -4` ตัวคูณคือ `1100` บิตเรียงกันเป็นกลุ่มก้อน เมื่อตรวจพบความเปลี่ยนแปลงแค่จุดเดียว ระบบจะทำการ + หรือ - ตามรอบนั้น แต่รอบที่เป็น `00` หรือ `11` ระบบจะข้ามไปทำการ Shift ทันที (ค่ากลายเป็น 0) ทำให้รวดเร็วกว่า

### ประสิทธิภาพของ Bit-pair Recoding (Modified Booth's)
การเข้ารหัสแบบ Bit-pair ช่วย **ลดจำนวนรอบของการประมวลผล (Steps หรือ Partial Products) ลงได้ถึงครึ่งหนึ่ง** (จาก 4 รอบ เหลือ 2 รอบ) อย่างสม่ำเสมอ โดยจับคู่พิจารณาชิ้นข้อมูลทีละ 3 บิต:
- จากตารางการทำงานแบบ Bit-pair จะเห็นว่าการบวก Partial Products มีเพียงแค่ 2 บรรทัดเท่านั้น (เทียบกับ Booth's ที่มี 4 บรรทัด)
- **สรุปผลลัพธ์:** วงจร Modified Booth สามารถลดระยะเวลาหน่วงของการคำนวณ (Latency) ลงได้อย่างน้อยครึ่งหนึ่ง ไม่ว่าหน้าตาของบิตตัวคูณจะเป็นเลขที่มีค่าสลับไปมาอย่าง `0101` หรือมาเป็นกลุ่มอย่าง `1100` ก็จะให้ผลลัพธ์โครงสร้างจำนวนแถวที่เป็น 2 รอบคงที่เสมอ ซึ่งเหนือกว่าและมีประสิทธิภาพกว่าวิธีกระจายแบบ Booth's ปกติที่มีความแกว่งขึ้นอยู่กับลักษณะของชุดบิต