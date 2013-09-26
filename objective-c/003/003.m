#import <stdint.h>
#import <Foundation/Foundation.h>

void primeFactors(uint64_t n, NSMutableArray *factors);

int main(int argc, char * argv[]){
  NSMutableArray *factors;

  factors = [[NSMutableArray alloc] init];

  primeFactors(600851475143, factors);

  uint64_t max = [[factors objectAtIndex: 0] intValue];

  for (int i = 1; i < [factors count]; i++) {
    if ([[factors objectAtIndex: i] intValue] > max) {
      max = [[factors objectAtIndex: i] intValue];
    }
  }

  NSLog(@"%llu\n", max);

  [factors release];

  return 0;
}

void primeFactors(uint64_t n, NSMutableArray *factors) {
  BOOL found = false;

  uint64_t v = 2;

  for (uint64_t i = 2; i < n - 1; i++) {
    if (n % i == 0) {
      found = true;

      v = i;

      break;
    }
  }

  if (found) {
    [factors addObject: [NSNumber numberWithInt: v]];

    primeFactors(n / v, factors);
  } else {
    [factors addObject: [NSNumber numberWithInt: n]];
  }
}
