#import <Preferences/Preferences.h>
#include <spawn.h>
#include <signal.h>

@interface EasySpringListController: PSListController {
}
@end

@implementation EasySpringListController

- (void)respringDevice
{
   UIAlertController *vc = [UIAlertController
   alertControllerWithTitle:@"EasySpring Alert"
   message:@"Would you like to respring your device?"
   preferredStyle:UIAlertControllerStyleAlert];

   UIAlertAction* yesButton = [UIAlertAction
   actionWithTitle:@"Respring"
   style:UIAlertActionStyleDefault
   handler:^(UIAlertAction *action)
   {
      pid_t pid;
      int status;
      const char *argv[] = {"killall", "SpringBoard", NULL};
      posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char* const*)argv, NULL);
      waitpid(pid, &status, WEXITED);
   }];

   UIAlertAction* noButton = [UIAlertAction
   actionWithTitle:@"Cancel"
   style:UIAlertActionStyleDefault
   handler:^(UIAlertAction *action) 
   {
		
   }];

   [vc addAction:yesButton];
   [vc addAction:noButton];
   UIViewController *rootView = [[UIApplication sharedApplication].keyWindow rootViewController];
   [rootView presentViewController:vc animated:YES completion:nil];

    NSLog(@"stack: %@", [NSThread callStackSymbols]);
}

/*
- (void)rebootDevice
{
   UIAlertController *vc = [UIAlertController
   alertControllerWithTitle:@"EasySpring Alert"
   message:@"Would you like to reboot your device?"
   preferredStyle:UIAlertControllerStyleAlert];

   UIAlertAction* yesButton = [UIAlertAction
   actionWithTitle:@"Reboot"
   style:UIAlertActionStyleDefault
   handler:^(UIAlertAction *action)
   {
      //system("reboot");
   	  pid_t pid;
      int status;
      const char *argv[] = {"reboot", NULL, NULL};
      posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char* const*)argv, NULL);
      waitpid(pid, &status, WEXITED);
   }];

   UIAlertAction* noButton = [UIAlertAction
   actionWithTitle:@"Cancel"
   style:UIAlertActionStyleDefault
   handler:^(UIAlertAction *action) 
   {
		 
   }];

   [vc addAction:yesButton];
   [vc addAction:noButton];
   UIViewController *rootView = [[UIApplication sharedApplication].keyWindow rootViewController];
   [rootView presentViewController:vc animated:YES completion:nil];

    NSLog(@"stack: %@", [NSThread callStackSymbols]);
}

- (void)safeMode
{
   UIAlertController *vc = [UIAlertController
   alertControllerWithTitle:@"EasySpring Alert"
   message:@"Would you like to enter safe mode?"
   preferredStyle:UIAlertControllerStyleAlert];

   UIAlertAction* yesButton = [UIAlertAction
   actionWithTitle:@"Safe Mode"
   style:UIAlertActionStyleDefault
   handler:^(UIAlertAction *action)
   {
   	  pid_t pid;
      int status;
      const char *argv[] = {"killall -SEGV", "SpringBoard", NULL};
      posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char* const*)argv, NULL);
      waitpid(pid, &status, WEXITED);
      //system("killall -SEGV SpringBoard");
   }];

   UIAlertAction* noButton = [UIAlertAction
   actionWithTitle:@"Cancel"
   style:UIAlertActionStyleDefault
   handler:^(UIAlertAction *action) 
   {
		   
   }];

   [vc addAction:yesButton];
   [vc addAction:noButton];
   UIViewController *rootView = [[UIApplication sharedApplication].keyWindow rootViewController];
   [rootView presentViewController:vc animated:YES completion:nil];

    NSLog(@"stack: %@", [NSThread callStackSymbols]);
}

- (void)clearCache
{
   UIAlertController *vc = [UIAlertController
   alertControllerWithTitle:@"EasySpring Alert"
   message:@"Would you like to clear your UICache?"
   preferredStyle:UIAlertControllerStyleAlert];

   UIAlertAction* yesButton = [UIAlertAction
   actionWithTitle:@"Clear Cache"
   style:UIAlertActionStyleDefault
   handler:^(UIAlertAction *action)
   {
   	  pid_t pid;
      int status;
      const char *argv[] = {"uicache", NULL, NULL};
      posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char* const*)argv, NULL);
      waitpid(pid, &status, WEXITED);

      pid_t pid;
      int status;
      const char *argv[] = {"killall", "SpringBoard", NULL};
      posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char* const*)argv, NULL);
      waitpid(pid, &status, WEXITED);
      //system("uicache");
      //system("killall -9 SpringBoard");
   }];

   UIAlertAction* noButton = [UIAlertAction
   actionWithTitle:@"Cancel"
   style:UIAlertActionStyleDefault
   handler:^(UIAlertAction *action) 
   {
	    
   }];

   [vc addAction:yesButton];
   [vc addAction:noButton];
   UIViewController *rootView = [[UIApplication sharedApplication].keyWindow rootViewController];
   [rootView presentViewController:vc animated:YES completion:nil];

    NSLog(@"stack: %@", [NSThread callStackSymbols]);
} 
*/

- (void)twitterNav
{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.twitter.com/ioschrisharris"]];
}

- (void)paypalNav
{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=VU58K2NHRLK22"]];
}

- (void)gitNav
{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.github.com/ioschris"]];
}

- (void)redditNav
{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.reddit.com/u/rob311"]];
}

- (void)redditNavTwo
{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.reddit.com/u/jontelang"]];
}


- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [self loadSpecifiersFromPlistName:@"EasySpring" target:self];
	}
	return _specifiers;
}
@end

// vim:ft=objc