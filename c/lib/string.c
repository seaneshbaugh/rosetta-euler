#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "string.h"

String *stringNew() {
  String *newString = calloc(1, sizeof(String));

  if (newString == 0) {
    return (void*)0;
  }

  newString->data = calloc(1024, sizeof(char));

  if (newString->data == 0) {
    free(newString);

    return (void*)0;
  }

  newString->capacity = 1024;

  newString->length = 0;

  newString->frozen = false;

  return newString;
}

void stringDestroy(String *string) {
  if (string != 0) {
    if (string->data != 0) {
        free(string->data);
    }

    free(string);
  }
}

String *stringFromPointer(const char *initialString) {
  String *newString = calloc(1, sizeof(String));

  if (newString == 0) {
    return (void*)0;
  }

  unsigned long long length = 0;

  const char *currentCharacter = initialString;

  while (*currentCharacter != 0) {
    currentCharacter++;

    length++;
  }

  unsigned long long v = length + 1;

  unsigned long long capacity = 1;

  while (v >>= 1) {
    capacity <<= 1;
  }

  if (capacity >= 1024) {
    newString->capacity = capacity;
  } else {
    newString->capacity = 1024;
  }

  newString->data = calloc(newString->capacity, sizeof(char));

  if (newString->data == 0) {
    free(newString);

    return (void*)0;
  }

  newString->length = length;

  for (unsigned long long i = 0; i < newString->length; i++) {
    newString->data[i] = initialString[i];
  }

  newString->data[newString->length] = '\0';

  newString->frozen = false;

  return newString;
}

String *stringFromString(const String *initialString) {
  String *newString = calloc(1, sizeof(String));

  if (newString == 0) {
    return (void*)0;
  }

  newString->data = calloc(initialString->capacity, sizeof(char));

  if (newString->data == 0) {
    free(newString);

    return (void*)0;
  }

  newString->capacity = initialString->capacity;

  newString->length = initialString->length;

  for (unsigned long long i = 0; i < initialString->length; i++) {
    newString->data[i] = initialString->data[i];
  }

  newString->data[newString->length] = '\0';

  newString->frozen = initialString->frozen;

  return newString;
}

String *stringAdd(String *initialString, const char newCharacter) {
  if (newCharacter != '\0') {
    if (initialString->length + 1 > initialString->capacity) {
      initialString->capacity *= 2;

      initialString->data = realloc(initialString->data, sizeof(char) * initialString->capacity);
    }

    initialString->data[initialString->length] = newCharacter;

    initialString->length += 1;
  }

  return initialString;
}

String *stringAppend(String *initialString, const String *otherString) {
  unsigned long long i;

  for (i = 0; i < otherString->length; i++) {
    stringAdd(initialString, otherString->data[i]);
  }

  return initialString;
}

char stringAt(const String *string, long long index) {
  if (string->length > 0) {
    if (index >= 0) {
      index = index % (signed long long)string->length;
    } else {
      index = index * -1;

      index = (signed long long)string->length - (index % (signed long long)string->length);
    }

    return string->data[index];
  } else {
    return '\0';
  }
}

String *stringCapitalize(String *initialString) {
  if (initialString->length > 0) {
    if (initialString->data[0] >= 'a' && initialString->data[0] <= 'z') {
      initialString->data[0] -= 32;
    }
  }

  return initialString;
}

int stringCaseInsensitiveCompare(const String *leftHandString, const String *rightHandString) {
  String *leftHandCopy = stringFromString(leftHandString);

  String *rightHandCopy = stringFromString(rightHandString);

  stringDowncase(leftHandCopy);

  stringDowncase(rightHandCopy);

  int result = stringCompare(leftHandCopy, rightHandCopy);

  stringDestroy(leftHandCopy);

  stringDestroy(rightHandCopy);

  return result;
}

String *stringCenter(String *initialString, const unsigned long long width, const String *paddingString) {
  stringJustify(initialString, width, paddingString, 'c');

  return initialString;
}

String *stringChomp(String *initialString) {
  if (initialString->length > 1) {
    if (initialString->data[initialString->length - 2] == '\r' && initialString->data[initialString->length - 1] == '\n') {
      initialString->data[initialString->length - 2] = '\0';

      initialString->data[initialString->length - 1] = '\0';

      initialString->length -= 2;
    } else {
      if (initialString->data[initialString->length - 1] == '\n' || initialString->data[initialString->length - 1] == '\r') {
        initialString->data[initialString->length - 1] = '\0';

        initialString->length -= 1;
      }
    }
  } else {
    if (initialString->length == 1) {
      if (initialString->data[0] == '\n' || initialString->data[0] == '\r') {
        initialString->data[0] = '\0';

        initialString->length = 0;
      }
    }
  }

  return initialString;
}

String *stringChop(String *initialString) {
  if (initialString->length > 0) {
    initialString->data[initialString->length - 1] = '\0';

    initialString->length -= 1;
  }

  return initialString;
}

int stringCompare(const String *leftHandString, const String *rightHandString) {
  if (leftHandString == rightHandString) {
    return 0;
  }

  unsigned long long minLength;

  if (leftHandString->length < rightHandString->length) {
    minLength = leftHandString->length;
  } else {
    minLength = rightHandString->length;
  }

  int result = memcmp(leftHandString->data, rightHandString->data, minLength);

  if (leftHandString->data == rightHandString->data || result == 0) {
    if (leftHandString->length == rightHandString->length) {
        return 0;
    } else {
      if (leftHandString->length > rightHandString->length) {
        return 1;
      } else {
        return -1;
      }
    }
  } else {
    if (result > 0) {
      return 1;
    } else {
      return -1;
    }
  }
}

String *stringConcatenate(String *initialString, const String *otherString) {
  stringAppend(initialString, otherString);

  return initialString;
}

String *stringCopy(String *initialString, const String *otherString) {
  initialString->length = 0;

  stringAppend(initialString, otherString);

  return initialString;
}

unsigned long long stringCount(const String *initialString, unsigned long long count, ...) {
  va_list ap;

  va_start(ap, count);

  for (unsigned long long i = 0; i < count; i++) {
    String *otherString = va_arg(ap, String*);


  }

  va_end(ap);

  return 0;
}

String *stringDelete(String *initialString, const String *otherString) {
  return initialString;
}

String *stringDowncase(String *initialString) {
  for (unsigned long long i = 0; i < initialString->length; i++) {
    if (initialString->data[i] >= 'A' && initialString->data[i] <= 'Z') {
      initialString->data[i] += 32;
    }
  }

  return initialString;
}

String *stringDump(String *initialString) {
  return initialString;
}

String *stringEmpty(String *initialString) {
  return initialString;
}

bool stringEndsWith(const String *initialString, const String *otherString) {
  return false;
}

bool stringEquals(const String *leftHandString, const String *rightHandString) {
  if (leftHandString->length != rightHandString->length) {
    return false;
  }

  unsigned long long result = 0;

  for (int i = 0; i < leftHandString->length; i++) {
    result |= leftHandString->data[i] ^ rightHandString->data[i];
  }

  return result == 0;
}

long long stringFind(const String *initialString, const String *otherString) {
  // String *slice;
  //
  // if (otherString->length > initialString->length) {
  //   return -1;
  // }

  return 0;
}

char stringFirst(const String *string) {
  return '\0';
}

String *stringFreeze(String *initialString) {
  initialString->frozen = true;

  return initialString;
}

char stringHead(const String *string) {
  return '\0';
}

bool stringIncludes(const String *initialString, const String *otherString) {
  return false;
}

String *stringInsert(String *initialString, const long long index, const String *otherString) {
  return initialString;
}

String *stringInspect(const String *initialString) {
  return initialString;
}

bool stringIsEmpty(const String *string) {
  return false;
}

String *stringJustify(String *initialString, const unsigned long long width, const String *paddingString, const char justifyFlag) {
  if (initialString->length >= width || paddingString->length == 0) {
    return initialString;
  }

  unsigned long long paddingWidth, leftPaddingWidth, rightPaddingWidth;

  paddingWidth = width - initialString->length;

  if (justifyFlag == 'l') {
    leftPaddingWidth = paddingWidth;

    rightPaddingWidth = 0;
  } else {
    if (justifyFlag == 'r') {
      leftPaddingWidth = 0;

      rightPaddingWidth = paddingWidth;
    } else {
      leftPaddingWidth = paddingWidth / 2;

      rightPaddingWidth = paddingWidth - leftPaddingWidth;
    }
  }

  String *leftPadding;

  String *rightPadding;

  if (leftPaddingWidth > 0) {
    leftPadding = stringFromString(paddingString);

    stringMultiply(leftPadding, (leftPaddingWidth / paddingString->length) + 1);

    stringTruncate(leftPadding, leftPaddingWidth);

    stringPrepend(initialString, leftPadding);

    stringDestroy(leftPadding);
  }

  if (rightPaddingWidth > 0) {
    rightPadding = stringFromString(paddingString);

    stringMultiply(rightPadding, (rightPaddingWidth / paddingString->length) + 1);

    stringTruncate(rightPadding, rightPaddingWidth);

    stringAppend(initialString, rightPadding);

    stringDestroy(rightPadding);
  }

  return initialString;
}

char stringLast(const String *string) {
  return '\0';
}

String *stringLeftJustify(String *initialString, const unsigned long long width, const String *paddingString) {
  stringJustify(initialString, width, paddingString, 'l');

  return initialString;
}

String *stringLeftStrip(String *initialString) {
  return initialString;
}

unsigned long long stringLength(const String *string) {
  return 0;
}

String *stringMultiply(String *initialString, const unsigned long long factor) {
  String *copy = stringFromString(initialString);

  for (unsigned long long i = 1; i <= factor; i++) {
    stringAppend(initialString, copy);
  }

  stringDestroy(copy);

  return initialString;
}

String *stringNext(String *initialString) {
  return initialString;
}

String *stringPrepend(String *initialString, const String *otherString) {
  String *result = stringFromString(otherString);

  stringAppend(result, initialString);

  stringCopy(initialString, result);

  stringDestroy(result);

  return initialString;
}

String *stringReplace(String *initialString, const String *otherString) {
  return initialString;
}

String *stringReverse(String *initialString) {
  return initialString;
}

long long stringReverseFind(const String *initialString, const String *otherString) {
  return 0;
}

String *stringRightJustify(String *initialString, const unsigned long long width, const String *paddingString) {
  stringJustify(initialString, width, paddingString, 'r');

  return initialString;
}

String *stringRightStrip(String *initialString) {
  return initialString;
}

String *stringSetAt(String *initialString, const long long index, char character) {
  return initialString;
}

String *stringSetSlice(String *initialString, const long long start, const unsigned long long length, const String *otherString) {
  return initialString;
}

String *stringSetSubstring(String *initialString, const long long beginning, const long long end, const String *otherString) {
  return initialString;
}

String *stringSlice(const String *initialString, const long long start, const unsigned long long length) {
  String *result = stringNew();

  if (start < initialString->length) {
    for (unsigned long long i = start; i < initialString->length && i < start + length; i++) {
      stringAdd(result, initialString->date[i]);
    }
  }

  return result;
}

String *stringSqueeze(String *initialString) {
  return initialString;
}

bool stringStartsWith(const String *initialString, const String *otherString) {
  return false;
}

String *stringStrip(String *initialString) {
  return initialString;
}

String *stringSubstring(const String *initialString, const long long beginning, const long long end) {
  String *result;

  if (beginning < end) {
    reseult = stringSlice(initialString, beginning, end - beginning);
  } else {
    reseult = stringSlice(initialString, end, beginning - end);
  }

  return result;
}

String *stringSwapcase(String *initialString) {
  return initialString;
}

String *stringTail(const String *initialString) {
  return initialString;
}

char* stringToPointer(String *initialString) {
  return (char*)0;
}

String *stringTruncate(String *initialString, const unsigned long long newLength) {
  if (newLength >= initialString->length) {
    return initialString;
  }

  for (unsigned long long i = newLength; i < initialString->length; i++) {
    initialString->data[i] = '\0';
  }

  initialString->length = newLength;

  return initialString;
}

String *stringUnfreeze(String *initialString) {
  initialString->frozen = false;

  return initialString;
}

String *stringUpcase(String *initialString) {
  for (unsigned long long i = 0; i < initialString->length; i++) {
    if (initialString->data[i] >= 'a' && initialString->data[i] <= 'z') {
      initialString->data[i] -= 32;
    }
  }

  return initialString;
}
