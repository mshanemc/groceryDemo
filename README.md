# Salesforce mobile low-code demo

## Deploy to one of my scratch orgs (no CLI or sfdx required!)
Source repo for our Salesforce mobile webinar.  To get a copy of the org, click the button.

[![Deploy](https://raw.githubusercontent.com/mshanemc/deploy-to-sfdx/master/assets/sfdx_it_now.png)](https://hosted-scratch.herokuapp.com/launch?template=https://github.com/mshanemc/groceryDemo)


Once the org opens, be sure to change your email address on your user...there's a good chance when you sign into the mobile app, Salesforce will try to send you a confirmation email.

---


## Deploy to your own scratch org
Already using sfdx, and have a dev hub?  Install my plugin, clone, and run the orgInit script.

You'll need [my sfdx plugin](https://github.com/mshanemc/sfdx-msm-plugins) from here: `sfdx plugins:install sfdx-msm-plugins`

then

```bash
git clone https://github.com/mshanemc/groceryDemo
cd groceryDemo
./orgInit
```
