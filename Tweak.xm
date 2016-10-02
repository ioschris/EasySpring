#include "headers/libactivator.h"
#include <spawn.h> 
#include <signal.h>

@interface EasySpring : NSObject <LAListener>
@end

@implementation EasySpring

- (void)activator:(LAActivator *)activator 
	 receiveEvent:(LAEvent *)event 
  forListenerName:(NSString *)listenerName
{
    pid_t pid;
    int status;
    const char *argv[] = {"killall", "SpringBoard", NULL};
    posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char* const*)argv, NULL);
    waitpid(pid, &status, WEXITED);
}
@end

static EasySpring *easyspringInstance;

%ctor{
	easyspringInstance = [[EasySpring alloc] init];
	[[LAActivator sharedInstance] registerListener:easyspringInstance 
						forName:@"com.chfreeware.easyspring"];
}