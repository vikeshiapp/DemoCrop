//
//  ViewController.m
//  Crop
//
//  Created by iApp on 08/03/18.
//  Copyright © 2018 iApp. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    UIImageView *imageDemo;
}
@property (weak, nonatomic) IBOutlet UIButton *demoBtn;
@property NSUInteger number;

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addObserver:self forKeyPath:@"number" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    
    UILabel *lblb = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    [self.view addSubview:lblb];
    lblb.backgroundColor =  [UIColor yellowColor];
    
    //The first one is the setValue:forKey: and the second is the setValue:forKeyPath:.
    
    
    
        imageDemo = [[UIImageView alloc]initWithFrame:CGRectMake(100, 80, 100, 80)];
        [self.view addSubview:imageDemo];
        imageDemo.image = [UIImage imageNamed:@"slide maker"];
        imageDemo.contentMode =UIViewContentModeScaleAspectFill;
    
    [self createTranfomrAmime];
    ////Branch Two Work
}

    -(void)createTranfomrAmime{

        [UIView animateWithDuration:4.0 animations:^{

            imageDemo.transform = CGAffineTransformScale(imageDemo.transform, -1, 1);

        }];

    }
- (IBAction)ButtonAction:(id)sender {
    
    self.number++;
    NSLog(@"%i", (int)self.number);
    
    
    
    [self setValue:[UIColor redColor] forKeyPath:@"self.demoBtn.backgroundColor"];
    
    UILabel *lblb = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    [self.view addSubview:lblb];
    lblb.backgroundColor =  [UIColor yellowColor];
//    lblb setValue:<#(nullable id)#> forKey:<#(nonnull NSString *)#>
    
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
