#pragma once

typedef struct {
  unsigned long long *values;
  unsigned long long capacity;
  unsigned long long length;
} NumberList;

extern void initializeList(NumberList *list);

extern void deinitializeList(NumberList *list);

extern void push(NumberList *list, unsigned long long value);

extern int find(NumberList *list, unsigned long long value);

extern void removeAt(NumberList *list, int index);

extern void concat(NumberList *a, NumberList *b);

extern int listAscendingCompare(const void *a, const void *b);

extern int listDescendingCompare(const void *a, const void *b);

extern void sortAscending(NumberList *list);

extern void sortDescending(NumberList *list);

extern void overlap(NumberList *a, NumberList *b);

extern char* toString(NumberList *list);
