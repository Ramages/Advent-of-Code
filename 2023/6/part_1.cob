000100     IDENTIFICATION DIVISION.
000200     PROGRAM-ID. partOne.
000300     ENVIRONMENT DIVISION.
000400     DATA DIVISION.
000500     WORKING-STORAGE SECTION.
000600          01 time_one PIC 9(2) VALUE xxxx.
000700          01 time_two PIC 9(2) VALUE xxxx.
000800          01 time_three PIC 9(2) VALUE xxxx.
000900          01 time_four PIC 9(2) VALUE xxxx.
001000          01 res_1 PIC 9(8) VALUE 0.
001100          01 res_2 PIC 9(8) VALUE 0.
001200          01 res_3 PIC 9(8) VALUE 0.
001300          01 res_4 PIC 9(8) VALUE 0.  
001400          01 speed_one PIC 9(8) VALUE 0.
001500          01 speed_two PIC 9(8) VALUE 0.
001600          01 speed_three PIC 9(8) VALUE 0.
001700          01 speed_four PIC 9(8) VALUE 0.
001800          01 final_result PIC 9(10) VALUE 1.
001900     PROCEDURE DIVISION.
002000     MAIN-PROCEDURE.
002100          PERFORM FIRST-NUMBER UNTIL time_one = 0.
002200          MULTIPLY final_result BY res_1 GIVING final_result.
002300          PERFORM SECOND-NUMBER UNTIL time_two = 0.
002400          MULTIPLY final_result BY res_2 GIVING final_result.
002500          PERFORM THIRD-NUMBER UNTIL time_three = 0.
002600          MULTIPLY final_result BY res_3 GIVING final_result.
002700          PERFORM FOURTH-NUMBER UNTIL time_four = 0.
002800          MULTIPLY final_result BY res_4 GIVING final_result.
002900
003000          DISPLAY "Final result: " final_result.
003100
003200          STOP RUN.
003300     FIRST-NUMBER.
003400          IF time_one * speed_one > xxxx THEN
003500              ADD 1 TO res_1.
003600          SUBTRACT 1 FROM time_one.
003700          ADD 1 TO speed_one.
003800     SECOND-NUMBER.
003900          IF time_two * speed_two > xxxx THEN
004000              ADD 1 TO res_2.
004100          SUBTRACT 1 FROM time_two.
004200          ADD 1 TO speed_two.
004300     THIRD-NUMBER.
004400          IF time_three * speed_three > xxxx THEN
004500              ADD 1 TO res_3.
004600          SUBTRACT 1 FROM time_three.
004700          ADD 1 TO speed_three.
004800     FOURTH-NUMBER.
004900          IF time_four * speed_four > xxxx THEN
005000              ADD 1 TO res_4.
005100          SUBTRACT 1 FROM time_four.
005200          ADD 1 TO speed_four.
005300     END PROGRAM partOne.
