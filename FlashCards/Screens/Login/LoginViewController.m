//
//  LoginViewController.m
//  FlashCards
//
//  Created by JetBrains on 01.09.19.
//  Copyright © 2019 JetBrains. All rights reserved.
//

#import "LoginViewController.h"
#import "EmailValidator.h"
#import "PasswordValidator.h"
#import "AlertHelper.h"
#import "LoginModel.h"

@interface LoginViewController () <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *textFieldEmail;
@property (strong, nonatomic) IBOutlet UILabel *labelInfo;
@property (strong, nonatomic) IBOutlet UITextField *textFieldPassword;
@property (strong, nonatomic) IBOutlet UIButton *buttonLogin;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@property (strong, nonatomic) EmailValidator *emailValidator;
@property (strong, nonatomic) PasswordValidator *passwordValidator;
@property (strong, nonatomic) AlertHelper *alertHelper;
@property (strong, nonatomic) LoginModel *loginModel;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.emailValidator = [EmailValidator new];
    self.passwordValidator = [PasswordValidator new];
    self.alertHelper = [AlertHelper new];
    self.loginModel = [LoginModel new];
    
    [self setupUI];
    [self setupDelegates];
    [self setupGestureRecognizer];
}

#pragma mark - Private
- (void)setupUI {
    self.navigationItem.title = @"Login";

    self.labelInfo.textColor = [UIColor blackColor];
    self.labelInfo.text = @"Enter your email and password";

    self.textFieldEmail.placeholder = @"Email";
    self.textFieldEmail.keyboardType = UIKeyboardTypeEmailAddress;
    self.textFieldEmail.autocorrectionType = UITextAutocorrectionTypeNo;
    self.textFieldEmail.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [self setIsValid:YES forTextField:self.textFieldEmail];

    self.textFieldPassword.placeholder = @"Password";
    self.textFieldPassword.autocorrectionType = UITextAutocorrectionTypeNo;
    self.textFieldPassword.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.textFieldPassword.secureTextEntry = YES;
    [self setIsValid:YES forTextField:self.textFieldPassword];

    self.buttonLogin.layer.borderColor = [[UIColor blackColor] CGColor];
    self.buttonLogin.layer.borderWidth = 1.0;
    [self.buttonLogin setTitleColor:[UIColor blackColor] forState: UIControlStateNormal];
    [self.buttonLogin setTitle:@"Login" forState:UIControlStateNormal];
}

- (void)setupDelegates {
    self.textFieldEmail.delegate = self;
    self.textFieldPassword.delegate = self;
}

- (void)setupGestureRecognizer {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
            action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
}

- (void)dismissKeyboard {
    [self.view endEditing:YES];
}

- (void)performLogin {
    NSString *email = self.textFieldEmail.text;
    BOOL isEmailValid = [self.emailValidator isEmailValid:email];
    if (isEmailValid == NO) {
        [self setIsValid:NO forTextField:self.textFieldEmail];
        [self showAlertEmailInvalid];
        return;
    }

    NSString *password = self.textFieldPassword.text;
    BOOL isPasswordValid = [self.passwordValidator isPasswordValid:password];
    if (isPasswordValid == NO) {
        [self setIsValid:NO forTextField:self.textFieldPassword];
        [self showAlertPasswordInvalid];
        return;
    }

    [self.view setUserInteractionEnabled:NO];
    [self.activityIndicator startAnimating];
    __weak typeof(self) weakSelf = self;
    
    [self.loginModel loginWithEmail:email password:password completion:^(BOOL success) {
        [self.view setUserInteractionEnabled:YES];
        [weakSelf.activityIndicator stopAnimating];
        if (success) {
            [weakSelf showAlertLoginSuccess];
        } else {
            [weakSelf showAlertLoginFailed];
        }
    }];
}

- (void)setIsValid:(BOOL)isValid forTextField:(UITextField *)textField {
    textField.textColor = isValid ? [UIColor blackColor] : [UIColor redColor];
}

- (void)showAlertEmailInvalid {
    [self showAlertWithTitle:@"Error" message:@"Email is not valid"];
}

- (void)showAlertPasswordInvalid {
    [self showAlertWithTitle:@"Error" message:@"Password is not valid"];
}

- (void)showAlertLoginFailed {
    [self showAlertWithTitle:@"Error" message:@"Login failed"];
}

- (void)showAlertLoginSuccess {
    [self showAlertWithTitle:@"Success!" message:@"You are logged in now"];
}

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message {
    NSArray <UIAlertAction *> *actions = @[[UIAlertAction okAction]];
    AlertParams *params = [[AlertParams alloc] initWithTitlle:title message:message style:
            UIAlertControllerStyleAlert actions: actions];
    UIAlertController *controller = [self.alertHelper createAlert:params];
    [self.navigationController presentViewController:controller animated:YES
                                          completion:nil];
}

#pragma mark - Actions
- (IBAction)buttonLoginPressed:(id)sender {
    [self dismissKeyboard];
    [self performLogin];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.textFieldEmail) {
        [self.textFieldPassword becomeFirstResponder];
    } else if (textField == self.textFieldPassword) {
        [self dismissKeyboard];
        [self performLogin];
    }
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range
replacementString:(NSString *)string {
    [self setIsValid:YES forTextField:textField];
    return YES;
}

@end
