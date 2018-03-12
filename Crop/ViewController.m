//
//  ViewController.m
//  Crop
//
//  Created by iApp on 08/03/18.
//  Copyright © 2018 iApp. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property NSUInteger number;

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self addObserver:self forKeyPath:@"number" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    
 

}


- (IBAction)ButtonAction:(id)sender {
    
    self.number++;
    NSLog(@"%i", (int)self.number);
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSLog(@"From KVO");
    if([keyPath isEqualToString:@"number"])
    {
        id oldC = [change objectForKey:NSKeyValueChangeOldKey];
        id newC = [change objectForKey:NSKeyValueChangeNewKey];
        
        NSLog(@"%@ %@", oldC, newC);
    }
}



@end
