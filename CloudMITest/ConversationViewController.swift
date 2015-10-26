//
//  ConversationViewController.swift
//  CloudMITest
//
//  Created by mozf on 15/10/22.
//  Copyright © 2015年 mozi. All rights reserved.
//

import UIKit

class ConversationViewController: RCConversationViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.targetId = "mozf"
        self.userName = "mozifeng"
        self.conversationType = RCConversationType.ConversationType_PRIVATE
        
        title = userName
        
    }
    
    func loadUser() {
        self.targetId = RCIMClient.sharedRCIMClient().currentUserInfo.userId
        self.userName = RCIMClient.sharedRCIMClient().currentUserInfo.name
        
        self.conversationType = RCConversationType.ConversationType_PRIVATE
        
        self.title = self.userName
        
        self.setMessageAvatarStyle(RCUserAvatarStyle.USER_AVATAR_CYCLE)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
