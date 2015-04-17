       IDENTIFICATION DIVISION.
       PROGRAM-ID. euler.
       *
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. RM-COBOL.
       OBJECT-COMPUTER. RM-COBOL.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 I PIC 9(4) VALUE 1.
       01 TOTAL PIC 9(6) VALUE 0.
       01 QUO PIC 9(6) VALUE 0.
       01 REM PIC 9(6) VALUE 0.
       PROCEDURE DIVISION.
       MAIN-LOGIC SECTION.
       BEGIN.
       PERFORM UNTIL I > 999
           DIVIDE 3 INTO I GIVING QUO REMAINDER REM
           IF REM = 0
               THEN
                   ADD I TO TOTAL GIVING TOTAL
               ELSE
                   DIVIDE 5 INTO I GIVING QUO REMAINDER REM
                   IF REM = 0
                       THEN
                           ADD I TO TOTAL GIVING TOTAL
                   END-IF
           END-IF
           ADD 1 TO I
       END-PERFORM
       DISPLAY TOTAL
       STOP RUN.
       MAIN-LOGIC-EXIT.
       EXIT.
