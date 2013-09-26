#import <Foundation/Foundation.h>

int main(int argc, char * argv[]){
  NSMutableArray *fibs;

  fibs = [[NSMutableArray alloc] initWithObjects: [NSNumber numberWithInt: 0], [NSNumber numberWithInt: 1], nil];

  while ([[fibs objectAtIndex: [fibs count] - 1] intValue] + [[fibs objectAtIndex: [fibs count] - 2] intValue] < 4000000) {
    [fibs addObject: [NSNumber numberWithInt: [[fibs objectAtIndex: [fibs count] - 1] intValue] + [[fibs objectAtIndex: [fibs count] - 2] intValue]]];
  }

  NSArray *evens = [fibs objectsAtIndexes: [fibs indexesOfObjectsPassingTest: ^BOOL(id object, NSUInteger index, BOOL *stop) { return [object intValue] % 2 == 0; }]];

  int i, sum;

  sum = 0;

  for (i = 0; i < [evens count]; i++) {
    sum += [[evens objectAtIndex: i] intValue];
  }

  NSLog(@"%d\n", sum);

  [fibs release];

  [evens release];

  return 0;
}
