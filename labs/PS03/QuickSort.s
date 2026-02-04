          ;  Program: Quick Sort (Recursive Lomuto Partition)
          ;  ==========================================================
Data      DCD     10, 12, 8, 1, 5, 7, 11, 6, 8 ; Initial Data (9 Elements)

          ;  --- Main Program Initialization ---
          LDR     SP, =0x1000 ; Init Stack Pointer (Safe Memory Area)
          LDR     R0, =Data ; R0 = Base Address of Array
          MOV     R1, #0 ; R1 = Low Index (Start)
          MOV     R2, #8 ; R2 = High Index (End)

          BL      QuickSort ; Call Main Recursive Function

Stop      B       Stop ; End Program (Infinite Loop)

          ;  Subroutine: QuickSort
          ;  Args: R0=Base, R1=Low, R2=High
          ;  ==========================================================
QuickSort 
          STMFD   SP!, {R4-R8, LR} ; Save Context & Return Address

          CMP     R1, R2 ; Check Base Case: Low >= High?
          BGE     QSReturn ; If true, single element left -> Return

          ;       --- Partition Setup (Pivot = Data[High]) ---
          SUB     R3, R1, #1 ; R3 (i) = Low - 1 (Partition Boundary)
          MOV     R4, R1 ; R4 (j) = Low (Loop Counter)

          LSL     R6, R2, #2 ; Calculate Offset for High
          LDR     R5, [R0, R6] ; R5 = Pivot Value (Data[High])

          ;       --- Partition Loop (Scan j from Low to High-1) ---
P_Loop    CMP     R4, R2 ; Check if j >= High
          BGE     P_End ; If true, exit loop

          LSL     R7, R4, #2 ; Calculate Offset for j
          LDR     R8, [R0, R7] ; R8 = Data[j]

          CMP     R8, R5 ; Compare Data[j] vs Pivot
          BGE     P_Next ; If Data[j] >= Pivot, Skip Swap

          ;       --- Swap Operation: Data[i] <-> Data[j] ---
          ADD     R3, R3, #1 ; Increment i (Move Boundary)
          LSL     R6, R3, #2 ; Calculate Offset for i
          LDR     R12, [R0, R6] ; R12 = Data[i] (Temp)
          STR     R8, [R0, R6] ; Data[i] = Data[j]
          STR     R12, [R0, R7] ; Data[j] = Temp (Old Data[i])

P_Next    ADD     R4, R4, #1 ; Increment j
          B       P_Loop ; Repeat Loop

P_End     ;       --- Place Pivot Correctly: Swap Data[i+1] <-> Data[High] ---
          ADD     R3, R3, #1 ; i = i + 1 (Correct Pivot Position)
          LSL     R6, R3, #2 ; Offset for i_new
          LSL     R7, R2, #2 ; Offset for High
          LDR     R8, [R0, R6] ; R8 = Data[i_new]
          LDR     R12, [R0, R7] ; R12 = Data[High] (Pivot)
          STR     R12, [R0, R6] ; Data[i_new] = Pivot
          STR     R8, [R0, R7] ; Data[High] = Old Data[i_new]

          ;  --- Recursive Calls ---
          ;  Note: R3 now holds 'pi' (Partition Index)

          ;       1. Sort Left Side: QuickSort(Low, pi - 1)
          STMFD   SP!, {R1, R2, R3} ; Save current context
          SUB     R2, R3, #1 ; Set New High = pi - 1
          BL      QuickSort ; Recursive Call
          LDMFD   SP!, {R1, R2, R3} ; Restore context

          ;       2. Sort Right Side: QuickSort(pi + 1, High)
          STMFD   SP!, {R1, R2, R3} ; Save current context
          ADD     R1, R3, #1 ; Set New Low = pi + 1
          BL      QuickSort ; Recursive Call
          LDMFD   SP!, {R1, R2, R3} ; Restore context

QSReturn  
          LDMFD   SP!, {R4-R8, PC} ; Restore Registers & Return
          END