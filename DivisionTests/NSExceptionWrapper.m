#import <XCTest/XCTest.h>
#import <exception>

@interface NSException (ForCppException)
@end

@implementation NSException (ForCppException)
- (id)initWithCppException:(const char *)cppException
{
    NSString* description = [NSString stringWithUTF8String:cppException];
    return [self initWithName:description reason:@"cppException" userInfo:nil];
}
@end

@interface XCTestCase (ForCppException)
@end

@implementation XCTestCase (ForCppException)
- (void)rethowNSExceptionForCppException:(void(^)())action {
    try {
        action();
    } catch (const std::exception& e) {
        @throw [[NSException alloc] initWithCppException:e.what()];
    }
}
@end

#define XCTAssertCppThrows(expression, format...) \
XCTAssertThrowsSpecificNamed([self rethowNSExceptionForCppException:^{expression;}], ## format)
