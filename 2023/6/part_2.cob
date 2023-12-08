000100     IDENTIFICATION DIVISION.
000200     PROGRAM-ID. partTwo.
000300     ENVIRONMENT DIVISION.
000400     DATA DIVISION.
000500     WORKING-STORAGE SECTION.
000600          01 tiem PIC 9(8) VALUE xxxx.
000800          01 time_sq PIC 9(32) VALUE 0.
000800          01 4xDist PIC 9(32) VALUE 0.
000800          01 hi PIC 9(16) VALUE 0.
000900          01 lo PIC 9(16) VALUE 0.
001800          01 final_result PIC 9(12) VALUE 0.
001900     PROCEDURE DIVISION.
002000     MAIN-PROCEDURE.
000000          COMPUTE time_sq = tiem*tiem.
000000          COMPUTE 4xDist = 4*xxxx.
002900          COMPUTE hi = (-tiem - (time_sq - 4xDist)**0.5) / -2.
002900          COMPUTE lo = (-tiem + (time_sq - 4xDist)**0.5) / -2.
000000          COMPUTE final_result = hi - lo.
003000          DISPLAY "Final result: " final_result.
003100
003200          STOP RUN.
005300     END PROGRAM partTwo.
