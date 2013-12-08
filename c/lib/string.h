#pragma once

#include <stdarg.h>
#include <stdbool.h>
#include <string.h>

typedef struct {
  char *data;
  unsigned long long capacity;
  unsigned long long length;
  bool frozen;
} String;

extern String *stringNew();

extern void stringDestroy(String *s);

extern String *stringFromPointer(const char *initialString);

extern String *stringFromString(const String *initialString);

extern String *stringAdd(String *initialString, const char newCharacter);

extern String *stringAppend(String *initialString, const String *otherString);

extern char stringAt(const String *string, long long index);

extern String *stringCapitalize(String *initialString);

extern int stringCaseInsensitiveCompare(const String *leftHandString, const String *rightHandString);

extern String *stringCenter(String *initialString, const unsigned long long width, const String *paddingString);

extern String *stringChomp(String *initialString);

extern String *stringChop(String *initialString);

extern int stringCompare(const String *leftHandString, const String *rightHandString);

extern String *stringConcatenate(String *initialString, const String *otherString);

extern String *stringCopy(String *initialString, const String *otherString);

extern unsigned long long stringCount(const String *initialString,  unsigned long long count, ...);

extern String *stringDelete(String *initialString, const String *otherString);

extern String *stringDowncase(String *initialString);

extern String *stringDump(String *InitialString);

extern String *stringEmpty(String *InitialString);

extern bool stringEndsWith(const String *initialString, const String *otherString);

extern bool stringEquals(const String *leftHandString, const String *rightHandString);

extern long long stringFind(const String *initialString, const String *otherString);

extern char stringFirst(const String *string);

extern String *stringFreeze(String *initialString);

extern char stringHead(const String *string);

extern bool stringIncludes(const String *initialString, const String *otherString);

extern String *stringInsert(String *initialString, const long long index, const String *otherString);

extern String *stringInspect(const String *initialString);

extern bool stringIsEmpty(const String *string);

extern String *stringJustify(String *initialString, const unsigned long long width, const String *paddingString, const char justifyFlag);

extern char stringLast(const String *string);

extern String *stringLeftJustify(String *initialString, const unsigned long long width, const String *paddingString);

extern String *stringLeftStrip(String *initialString);

extern unsigned long long stringLength(const String *string);

extern String *stringMultiply(String *initialString, const unsigned long long factor);

extern String *stringNext(String *initialString);

extern String *stringPrepend(String *initialString, const String *otherString);

extern String *stringReplace(String *initialString, const String *otherString);

extern String *stringReverse(String *initialString);

extern long long stringReverseFind(const String *initialString, const String *otherString);

extern String *stringRightJustify(String *initialString, const unsigned long long width, const String *paddingString);

extern String *stringRightStrip(String *initialString);

extern String *stringSetAt(String *initialString, const long long index, char character);

extern String *stringSetSlice(String *initialString, const long long start, const unsigned long long length, const String *otherString);

extern String *stringSetSubstring(String *initialString, const long long beginning, const long long end, const String *otherString);

extern String *stringSlice(const String *initialString, const long long start, const unsigned long long length);

extern String *stringSqueeze(String *initialString);

extern bool stringStartsWith(const String *initialString, const String *otherString);

extern String *stringStrip(String *initialString);

extern String *stringSubstring(const String *initialString, const long long beginning, const long long end);

extern String *stringSwapcase(String *initialString);

extern String *stringTail(const String *initialString);

extern char* stringToPointer(String *initialString);

extern String *stringTruncate(String *initialString, const unsigned long long newLength);

extern String *stringUnfreeze(String *initialString);

extern String *stringUpcase(String *initialString);
