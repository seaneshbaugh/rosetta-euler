       IDENTIFICATION DIVISION.
       PROGRAM-ID. euler.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. RM-COBOL.
       OBJECT-COMPUTER. RM-COBOL.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N PIC 9(12) VALUE 600851475143.
       01 P PIC 9(12) VALUE 2.
       01 QUO PIC 9(12) VALUE 0.
       01 REM PIC 9(12) VALUE 0.
       01 MAX-FACTOR PIC 9(12) VALUE 1.
       01 RESULT PIC Z(12).
       PROCEDURE DIVISION.
       MAIN-LOGIC SECTION.
       BEGIN.
       PERFORM FOREVER
           IF N < P * P
               MOVE N TO MAX-FACTOR
               EXIT PERFORM
           ELSE
               DIVIDE P INTO N GIVING QUO REMAINDER REM
               IF REM = 0
                   MOVE QUO TO N
                   MOVE P TO MAX-FACTOR
               ELSE
                   ADD 1 TO P
               END-IF
           END-IF
       END-PERFORM
       MOVE MAX-FACTOR TO RESULT
       DISPLAY FUNCTION TRIM (RESULT LEADING)
       STOP RUN.
       MAIN-LOGIC-EXIT.
       EXIT.
