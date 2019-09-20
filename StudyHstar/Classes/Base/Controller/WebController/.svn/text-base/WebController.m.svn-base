//
//  WebController.m
//  zbyy-app
//
//  Created by macbook on 2019/7/17.
//  Copyright © 2019 hstar. All rights reserved.
//

#import "WebController.h"
#import <WebKit/WebKit.h>

@interface WebController ()<WKUIDelegate,WKNavigationDelegate>
@property (strong, nonatomic) WKWebView *webView;


@property (strong, nonatomic) NSString *curUrl;//记录最后一次加载的url
@property (nonatomic,strong) UIButton *btnback;//返回按钮
@property (nonatomic,strong) UIButton *btnclose;//关闭按钮
@property (nonatomic,strong) UIBarButtonItem *leftSpace;

//@property (nonatomic, strong) UIProgressView *progressView;
//可返回的页面列表, 存储已打开过的网页
//@property (nonatomic,strong) WKBackForwardList * backForwardList;

@end

@implementation WebController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=self.titleStr;
    
    [self loadWebView];
}
//加载webview
-(void)loadWebView{
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    config.selectionGranularity = WKSelectionGranularityDynamic;
    config.allowsInlineMediaPlayback = YES;
    WKPreferences *preferences = [WKPreferences new];
    //是否支持JavaScript
    preferences.javaScriptEnabled = YES;
    //不通过用户交互，是否可以打开窗口
    preferences.javaScriptCanOpenWindowsAutomatically = YES;
    config.preferences = preferences;
    
    _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight - 64) configuration:config];
    [self.view addSubview:_webView];
    
    _webView.UIDelegate = self;// UI代理
    _webView.navigationDelegate = self;// 导航代理
    // 是否允许手势左滑返回上一级, 类似导航控制的左滑返回
    _webView.allowsBackForwardNavigationGestures = YES;
    //可返回的页面列表, 存储已打开过的网页
    //    self.backForwardList = [_webView backForwardList];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:self.urlStr]];
    [_webView loadRequest:request];
//    WEAKSELF
//    // KVO:第二种,只要对象的值改变,就会产生信号,订阅信号
//    [[_webView rac_valuesForKeyPath:@"title" observer:self] subscribeNext:^(id x) {
//        NSString *title=(NSString *)x;
//        if (title.length>0) {
//            if (![weakSelf.titleStr containsString:@".doc"]) {
//                weakSelf.navigationItem.title = x;
//            }
//        }
//
//    }];
    
    //    [self.view addSubview:self.progressView];
    //    [[_webView rac_valuesForKeyPath:@"estimatedProgress" observer:self] subscribeNext:^(id x) {
    ////        double *title=(NSString *)x;
    //        weakSelf.progressView.progress = weakSelf.webView.estimatedProgress;
    //        if (weakSelf.progressView.progress == 1) {
    //            /*
    //             *添加一个简单的动画，将progressView的Height变为1.4倍，在开始加载网页的代理中会恢复为1.5倍
    //             *动画时长0.25s，延时0.3s后开始动画
    //             *动画结束后将progressView隐藏
    //             */
    //            [UIView animateWithDuration:0.25f delay:0.3f options:UIViewAnimationOptionCurveEaseOut animations:^{
    //                weakSelf.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.4f);
    //            } completion:^(BOOL finished) {
    //                weakSelf.progressView.hidden = YES;
    //            }];
    //        }
    //    }];
    
    //    //刷新当前页面
    //    [_webView reload];
    
    //    NSString *path = [[NSBundle mainBundle] pathForResource:@"JStoOC.html" ofType:nil];
    //    NSString *htmlString = [[NSString alloc]initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    //    //加载本地html文件
    //    [_webView loadHTMLString:htmlString baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]]];
}

// 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    //    //开始加载网页时展示出progressView
    //    self.progressView.hidden = NO;
    //    //开始加载网页的时候将progressView的Height恢复为1.5倍
    //    self.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.5f);
    //    //防止progressView被网页挡住
    //    [self.view bringSubviewToFront:self.progressView];
}
// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error {
    //     self.progressView.hidden = YES;
}
// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation {
}
// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    //     self.progressView.hidden = YES;
}

//提交发生错误时调用
- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    //    self.progressView.hidden = YES;
}
// 接收到服务器跳转请求即服务重定向时之后调用
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation {
}

-(WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures
{
    KLog(@"createWebViewWithConfiguration");
    if (!navigationAction.targetFrame.isMainFrame) {
        [webView loadRequest:navigationAction.request];
    }
    return nil;
}


// 根据WebView对于即将跳转的HTTP请求头信息和相关信息来决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    
    NSString * urlStr = navigationAction.request.URL.absoluteString;
    if ([urlStr containsString:@"file://"]) {
        decisionHandler(WKNavigationActionPolicyCancel);//防止跨域漏洞
        return;
    }
    //如果是跳转一个新页面
    if(navigationAction.targetFrame ==nil) {
        [webView loadRequest:navigationAction.request];
    }
    KLog(@"❤️发送跳转请求：%@",urlStr);
    self.curUrl=urlStr;
    decisionHandler(WKNavigationActionPolicyAllow);

}

// 根据客户端受到的服务器响应头以及response相关信息来决定是否可以跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{
    NSString * urlStr = navigationResponse.response.URL.absoluteString;
    KLog(@"当前跳转地址：%@",urlStr);
    self.curUrl=urlStr;
    //允许跳转
    decisionHandler(WKNavigationResponsePolicyAllow);
    //不允许跳转
    //decisionHandler(WKNavigationResponsePolicyCancel);
}
//进程被终止时调用
- (void)webViewWebContentProcessDidTerminate:(WKWebView *)webView{
    KLog(@"进程被终止时调用");
}
-(void)webView:(WKWebView *)webView didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential * _Nullable))completionHandler{
    if([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust]) {
        if([challenge previousFailureCount] ==0){
            NSURLCredential*credential = [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];
            completionHandler(NSURLSessionAuthChallengeUseCredential, credential);
        }else{
            completionHandler(NSURLSessionAuthChallengeCancelAuthenticationChallenge,nil);
        }
        
    }
}
- (void)willMoveToParentViewController:(nullable UIViewController *)parent{
    if (self.Block) {
        self.Block();
    }
}
-(void)backBtnClick
{
    if (self.Block) {
        self.Block();
    }
    if([self isRootViewController] == NO && [self backToHomePage])
    {
        [super backBtnClick];
    }
    else if([self.webView canGoBack])
    {
        [self.webView goBack];
    }
    else if ([self isRootViewController] == NO)
    {
        [super backBtnClick];
    }
    //    [self reloadLeftBarButtonItems];//关闭按钮
}

//关闭按钮点击
-(void)closeBtnClick
{
    if ([self isRootViewController] == NO)
    {
        [super backBtnClick];
    }
}
-(BOOL)backToHomePage
{
    NSURL *url = [NSURL URLWithString:self.urlStr];
    NSURL *webViewURL = self.webView.URL;
//    WKBackForwardList * backForwardList=[self.webView backForwardList];
//    if (backForwardList.backList.count<2) {//只有一个链接能返回的时候  直接到首页.
//        return YES;
//    }
    return [url isEqual:webViewURL];
}
-(void)reloadLeftBarButtonItems
{
    NSMutableArray *barButtonItemsArray = [NSMutableArray new];
    
    if([self.webView canGoBack] || ([self.webView canGoBack] == NO && [self isRootViewController] == NO))
    {
        UIBarButtonItem *leftBackItem=[[UIBarButtonItem alloc]initWithCustomView:self.btnback];
        [barButtonItemsArray addObject:leftBackItem];
        [barButtonItemsArray addObject:self.leftSpace];
    }
    
    if([self isRootViewController] == NO && [barButtonItemsArray count])
    {
        UIBarButtonItem *leftcloseItem=[[UIBarButtonItem alloc]initWithCustomView:self.btnclose];
        [barButtonItemsArray addObject:leftcloseItem];
    }
    self.navigationItem.leftBarButtonItems = barButtonItemsArray;
}



-(BOOL)isRootViewController
{
    UINavigationController *navigationController = self.navigationController;
    if(!navigationController.viewControllers.firstObject)
    {
        return NO;
    }
    
    return navigationController.viewControllers.firstObject == self;
}
//关闭按钮
-(UIButton *)btnclose
{
    if (_btnclose==nil) {
        _btnclose=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 30)];
        [_btnclose setTitle:@" 关闭" forState:UIControlStateNormal];
        _btnclose.titleLabel.font=[UIFont systemFontOfSize:15];
        [_btnclose addTarget:self action:@selector(closeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btnclose;
}
//返回按钮
-(UIButton *)btnback
{
    if (_btnback==nil) {
        _btnback=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 30)];
        [_btnback setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [_btnback setTitle:@" 返回" forState:UIControlStateNormal];
        _btnback.titleLabel.font=[UIFont systemFontOfSize:15];
        //    [leftbtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_btnback addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btnback;
}

-(UIBarButtonItem *)leftSpace
{
    if (_leftSpace==nil) {
        _leftSpace = [[UIBarButtonItem alloc]   initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        _leftSpace.width = -12;
    }
    return _leftSpace;
}
//-(UIProgressView *)progressView
//{
//    if (_progressView==nil) {
//        //进度条初始化
//        _progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 2)];
//        _progressView.backgroundColor = [UIColor blueColor];
//        //设置进度条的高度，下面这句代码表示进度条的宽度变为原来的1倍，高度变为原来的1.5倍.
//       _progressView.transform = CGAffineTransformMakeScale(1.0f, 1.5f);
//    }
//    return _progressView;
//}
@end
