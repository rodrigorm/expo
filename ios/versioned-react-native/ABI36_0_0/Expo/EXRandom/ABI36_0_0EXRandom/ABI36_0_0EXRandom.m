// Copyright 2019-present 650 Industries. All rights reserved.

#import <ABI36_0_0EXRandom/ABI36_0_0EXRandom.h>

@implementation ABI36_0_0EXRandom

ABI36_0_0UM_EXPORT_MODULE(ExpoRandom);

ABI36_0_0UM_EXPORT_METHOD_AS(getRandomBase64StringAsync,
                    getRandomBase64StringAsync:(NSNumber *)count
                    resolver:(ABI36_0_0UMPromiseResolveBlock)resolve
                    rejecter:(ABI36_0_0UMPromiseRejectBlock)reject)
{
  NSUInteger _length = [count unsignedIntegerValue];
  NSMutableData *bytes = [NSMutableData dataWithLength:_length];
  
  OSStatus result = SecRandomCopyBytes(kSecRandomDefault, _length, [bytes mutableBytes]);
  if (result == errSecSuccess) {
    resolve([bytes base64EncodedStringWithOptions:0]);
  } else {
    reject(@"ERR_RANDOM", @"Failed to create a secure random number", [NSError errorWithDomain:@"expo-random" code:result userInfo:nil]);
  }
}


@end
