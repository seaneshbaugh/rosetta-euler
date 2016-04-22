#import <stdint.h>
#import <Foundation/Foundation.h>

int main(int argc, char * argv[]) {
  NSMutableArray *palindromes;

  palindromes = [[NSMutableArray alloc] init];

  for (int x = 100; x <= 999; x++) {
    for (int y = 100; y <= 999; y++) {
      int product = x * y;

      NSString* s = [NSString stringWithFormat: @"%i", product];

      NSMutableString *r = [NSMutableString string];

      NSInteger i = [s length];

      while (i > 0) {
        i--;

        NSRange range = NSMakeRange(i, 1);

        [r appendString: [s substringWithRange: range]];
      }

      if ([s isEqualToString: r]) {
        [palindromes addObject: [NSNumber numberWithInt: product]];
      }

      [r release];
    }
  }

  int max = [[palindromes objectAtIndex: 0] intValue];

  for (int i = 1; i < [palindromes count]; i++) {
    if ([[palindromes objectAtIndex: i] intValue] > max) {
      max = [[palindromes objectAtIndex: i] intValue];
    }
  }

  printf("%d\n", max);

  [palindromes release];

  return 0;
}
