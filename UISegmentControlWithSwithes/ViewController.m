//
//  ViewController.m
//  UISegmentControlWithSwithes
//
//  Created by Alivelu Ravula on 2/3/18.
//  Copyright © 2018 Alivelu Ravula. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor orangeColor];
    self.buttnArray=[[NSMutableArray alloc]init];
    self.objectsArray=[[NSMutableArray alloc]init];
    
    [self createUI];
    
}

-(void)createUI
{
    self.verAndHorzSC=[[UISegmentedControl alloc]initWithItems:@[@"ver",@"horz"]];
    self.verAndHorzSC.frame=CGRectMake(10, 20, 150, 40);
   // self.verAndHorzSC.tintColor=[UIColor whiteColor];
           [self.view addSubview:self.verAndHorzSC];
    [self.verAndHorzSC addTarget:self action:@selector(segAction:) forControlEvents:UIControlEventValueChanged];


    
    self.seg2=[[UISegmentedControl alloc]initWithItems:@[@"Lab",@"swi",@"But"]];
    self.seg2.frame=CGRectMake(180, 20, 200, 40);
    [self.view addSubview:self.seg2];
    [self.seg2 addTarget:self action:@selector(segAction:) forControlEvents:UIControlEventValueChanged];
    self.seg2.userInteractionEnabled=NO;

    
    self.slider=[[UISlider alloc]initWithFrame:CGRectMake(10, 50, 200, 200)];
    self.slider.minimumValue=0;
    self.slider.maximumValue=30;
    self.slider.userInteractionEnabled=NO;
    [self.view addSubview:self.slider];
    [self.slider addTarget:self action:@selector(changeSlider) forControlEvents:UIControlEventValueChanged];

    
    
    
    self.sliderValLbl=[[UILabel alloc]initWithFrame:CGRectMake(230, 110, 50, 30)];
    self.sliderValLbl.backgroundColor=[UIColor whiteColor];
     [self.view addSubview:self.sliderValLbl];
   


    
    self.buttn=[[UIButton alloc]initWithFrame:CGRectMake(320, 100, 70, 40)];
    [self.buttn setTitle:@"Add" forState:UIControlStateNormal];
    [self.buttn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    self.buttn.backgroundColor=[UIColor whiteColor];
    self.buttn.enabled=NO;
    [self.view addSubview:self.buttn];
    [self.buttn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];


    self.stepper=[[UIStepper alloc]initWithFrame:CGRectMake(300, 700, 70, 200)];
    self.stepper.minimumValue=0;
    self.stepper.maximumValue=30;
    self.stepper.userInteractionEnabled=NO;
    [self.view addSubview:self.stepper];
    [self.stepper addTarget:self action:@selector(stepperStep:) forControlEvents:UIControlEventValueChanged];

}
-(void)changeSlider
{
[self.sliderValLbl setText:[NSString stringWithFormat:@"%i",(int)self.slider.value]];
}
-(void)buttonAction:(id)sender
{
   
    if(sender==self.buttn)
    {
        
        [self.buttnArray addObject:[NSString stringWithFormat:@"%d",(int)self.slider.value]];
        [self.segAdd removeAllSegments];
       
        self.segAdd=[[UISegmentedControl alloc]initWithItems:self.buttnArray];
        self.segAdd.frame=CGRectMake(20, 170, 190, 30);
        [self.view addSubview:self.segAdd];
        [self.segAdd addTarget:self action:@selector(segAction:) forControlEvents:UIControlEventValueChanged];

    }


}
-(void)segAction:(id)sender
{
    self.slider.userInteractionEnabled=YES;
    self.stepper.userInteractionEnabled=YES;
    self.buttn.enabled=YES;
    self.seg2.userInteractionEnabled=YES;
    
     self.segmentValue=[[self.segAdd titleForSegmentAtIndex:self.segAdd.selectedSegmentIndex] intValue];
   
            self.stepper.value=self.segmentValue;
        [self methods];
    
}

-(void)methods{
    int x=20;
    int y=220;
     [self removeObjects];
       for(int i=1;i<=self.segmentValue;i++)
      {
       if(self.verAndHorzSC.selectedSegmentIndex==0)
         {
           if(self.seg2.selectedSegmentIndex==0)
            {
    
           UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(x,y, 30, 30)];
          label.backgroundColor=[UIColor whiteColor];
                [label setText:@"  L "];
                [label setTextColor:[UIColor blueColor]];
          [self.view addSubview:label];
          [self.objectsArray addObject:label];
            if(y<=650)
               {
                y=y+60;
               }
            else{
               y=220;
               x=x+60;
                }
}
  if(self.seg2.selectedSegmentIndex==1)
{
    UISwitch *mySwitch=[[UISwitch alloc]initWithFrame:CGRectMake(x,y, 30, 30)];
   // mySwitch.backgroundColor=[UIColor greenColor];
    [self.view addSubview:mySwitch];
    [self.objectsArray addObject:mySwitch];

    if(y<=650)
    {
        y=y+60;
    }
    else{
        y=220;
        x=x+60;
    }
    
}
  if(self.seg2.selectedSegmentIndex==2)
{
        UIButton *myButtn=[[UIButton alloc]initWithFrame:CGRectMake(x,y, 30, 30)];
        myButtn.backgroundColor=[UIColor blueColor];
    [myButtn setTitle:@"  B " forState:UIControlStateNormal];
    [myButtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.view addSubview:myButtn];
    [self.objectsArray addObject:myButtn];
    if(y<=650)
    {
        y=y+60;
    }
    else{
        y=220;
        x=x+60;
    }

}
         }

 else if (self.verAndHorzSC.selectedSegmentIndex==1)
 {
     if(self.seg2.selectedSegmentIndex==0)
     {
         
         UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(x,y, 30, 30)];
         label.backgroundColor=[UIColor whiteColor];
         [label setText:@"  L "];
         [label setTextColor:[UIColor blueColor]];

         [self.view addSubview:label];
         [self.objectsArray addObject:label];
         if(x<=350)
         {
             x=x+50;
         }
         else{
             y=y+50;
             x=30;
             

         }}
      if(self.seg2.selectedSegmentIndex==1)
     {
         UISwitch *mySwitch=[[UISwitch alloc]initWithFrame:CGRectMake(x,y, 30, 30)];
        // mySwitch.backgroundColor=[UIColor greenColor];
         [self.view addSubview:mySwitch];
         [self.objectsArray addObject:mySwitch];
         if(x<=350)
         {
             x=x+50;
         }
         else{
             y=y+50;
             x=30;
             

         }}
      if(self.seg2.selectedSegmentIndex==2)
     {
         UIButton *myButtn=[[UIButton alloc]initWithFrame:CGRectMake(x,y, 30, 30)];
         myButtn.backgroundColor=[UIColor blueColor];
        
         [myButtn setTitle:@"  B " forState:UIControlStateNormal];
         [myButtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
         [self.view addSubview:myButtn];
         [self.objectsArray addObject:myButtn];
         if(x<=350)
         {
             x=x+50;
         }
         else{
             y=y+50;
             x=30;
}
     }
 }
}
 

    }
-(void)removeObjects
{
    for(NSInteger j=0;j<self.objectsArray.count;j++)
    {
    
        
    UILabel *label=[self.objectsArray objectAtIndex:j];
        [label removeFromSuperview];
    }
    for(NSInteger j=0;j<self.objectsArray.count;j++)
        {
            UISwitch *mySwitch=[self.objectsArray objectAtIndex:j];
            [mySwitch removeFromSuperview];
            
        }
        
    for(NSInteger j=0;j<self.objectsArray.count;j++)
    {
        UIButton *myButtn=[self.objectsArray objectAtIndex:j];
        [myButtn removeFromSuperview];
        
    }
    
}
//-(void)changeStepper
//{
//
//    [self.slider setValue:self.stepper.value animated:YES];
//
//    [self changeSlider];
//
//}

- (void)stepperStep:(UIStepper *)sender
{
   
    if ( self.segmentValue< self.stepper.value)
    {
        self.segmentValue++;
        [self methods];        //Your Code You Wanted To Perform On Increment
    }
    else {
       self.segmentValue--;
        [self methods];        //Your Code You Wanted To Perform On Decrement
    }
 
    self.stepper.value=self.segmentValue;

    
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
