//
//  XMLReader.h
//
//

#import <Foundation/Foundation.h>


@interface XMLReader : NSObject<NSXMLParserDelegate>
{
    NSMutableArray *dictionaryStack;
    NSMutableString *textInProgress;
    NSError **errorPointer;
}

+ (NSDictionary *)dictionaryForBundle:(NSString*)name;
+ (NSDictionary *)dictionaryForXMLData:(NSData *)data error:(NSError **)errorPointer;
+ (NSDictionary *)dictionaryForXMLString:(NSString *)string error:(NSError **)errorPointer;
+(NSDictionary *)dictionaryForPath:(NSString *)path;
@end

//扩展对应的函数，找到深层次的节点信息，支持 . 表达式
@interface NSDictionary(Extra)
-(id)objectForPath:(NSString *)path;
@end
