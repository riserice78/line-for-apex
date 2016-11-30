# line-for-apex
Apex Wrapper for Line Api 

The following instructions assume that you have a developer trial Line account. A developer trial account is necessary so that you can use the Push Api.

<b>Installation by Unmanaged Packaged</b><br/>
https://goo.gl/wnZAVr
<br/><br/><br/>
<b>Installation by Deploy to Salesforce button</b><br/>
  1. Before deploying, create the following fields in the Contact object:
    - lineId (text)
    - lineImageUrl (text)
    - lineDisplayName (text)
    - lineIsFollowed (checkbox)
  2. Click on the deploy to salesforce button<br/>
<a href="https://githubsfdeploy.herokuapp.com?owner=riserice78&repo=line-for-apex">
  <img alt="Deploy to Salesforce"
       src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/deploy.png">
</a>
<br/><br/>
<b>Setup</b>
<pre>
1. Create the line callback site
    - Homepage: linecallback
    - Set the site guest user profile to have access to
      - LineController apex class
      - Create permission for Contact object
      - セキュアな接続 (HTTPS) が必要 = true
2. Add "https://api.line.me" to the remote site settings
3. Go to Line Business Center(https://business.line.me/ja/)
    3.1 Click on "Line@Manager" button for your developer trial line account
      - Click on Settings, then choose Bot Settings（日本語の場合、アカウント設定＞Bot設定）
      - In "Use webhooks", choose "Allow"
    3.2 Back in the Line Business Center page, click on "Line Developers" for your developer trial line account
      - Webhook url = site url (step 3) + "/services/apexrest/restapi"
      - Copy the Channel Access Token and paste it into the LineController apex class's CHANNEL_ACCESS_TOKEN variable.
4. On your line app, add your bot as a friend using the qr code
5. Go to the Contacts tab, your line user will be created as a new Contact. Unfollowing the bot will change the "lineIsFollowed" value.
6. To try push messages, open your force.com site (step 3)
</pre>
