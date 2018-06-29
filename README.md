# Crowdcoin Masternode Setup Guide (Ubuntu 16.04)
![Example-Logo](https://crowdcoin.site/img/logo-dark.png)

This guide will assist you in setting up a Crowdcoin Masternode on a Linux Server running Ubuntu 16.04.

This tutorial will guide you through the steps necessary to setup a Crowdcoin Masternode on a VPS server that is controlled from your remote wallet. This is the most secure way of configuring a masternode as the 1,000 CRC collateral resides in your local wallet and not within the remote masternode.

Your local wallet is not required to be kept open and you can store it as a cold wallet whilst still collecting masternode payments. Whilst there are other ways to setup masternodes, this is by far the most secure and is highly recommended.

***
### Table of contents
* **Requirements**
* **Part A**: Preparing the local wallet.
* **Part B**: Creating the VPS within [Aruba Cloud](https://www.arubacloud.com/) or [Vultr](https://www.vultr.com/?ref=7444311).
* **Part C**: Connecting to the vps and installing the masternode script via Putty.
* **Part D**: Connecting & Starting the masternode.
* **Part E**: Frequently Asked Questions

***
### Requirements
1) **1,000 CRC.**
2) **VPS running Linux Ubuntu 16.04.**
3) **Windows local wallet.**
4) **SSH client such as **[Putty](https://putty.org)** or [Bitvise](https://dl.bitvise.com/BvSshClient-Inst.exe)**

***
### Part A: Preparing the Local wallet

***Step 1:*** 
> Download the Crowdcoin wallet from our [official website](https://crowdcoin.site) or [Github](https://github.com/crowdcoinChain/Crowdcoin/releases)

***Step 2:*** 
> Start the Crowdcoin wallet !

![wallet](https://i.imgur.com/iYDRSpZ.jpg)

* If you are prompted to allow access by the firewall, do so.
* If the wallet is not synching, add the nodes in the configuration file.

Open the configuration from `Tools > Open Wallet Configuration File`. Restart the wallet every time you update the configuration file.

```
addnode=84.17.23.43:12875   
addnode=18.220.138.90:12875   
addnode=86.57.164.166:12875   
addnode=86.57.164.146:12875   
addnode=18.217.78.145:12875   
addnode=23.92.30.230:12875   
addnode=35.190.182.68:12875   
addnode=80.209.236.4:12875   
addnode=91.201.40.89:12875
```

***Step 3:***
> Create masternode public address

Depending on the number of masternodes you will be running, you will want to create a unique receiving address for each. A receiving address can be created in the wallet by selecting `File - Receiving addresses` in the menu the wallet.    
Click `New`, type in a label and click on ***OK*** to create a new receiving address. Create a new address for each masternode that you intend to run.

![gen-address1](https://i.imgur.com/Dag9qTV.jpg)

![gen-address2](https://i.imgur.com/4GJFL03.jpg)

***Step 4:***
> Generate masternode genkey

Each masternode has a unique masternode key. This key is generated by the local wallet, however it is placed in the remote nodes configuration file to identify the masternode as your own. The key does not allow any access to collateral or coins earned so it is not a security concern but best practice is to keep it private.

In the debug console `Tools - Debug console` type `masternode genkey` in order to generate a unique masternode key. 
Run this command multiple times if you are intending to run multiple masternodes. Record these details for later use.

![genkey](https://i.imgur.com/wlzv8Cd.jpg) 

***Step 5:***
> Transfer 1,000 CRC to each masternode public address

To allow your remote masternode to start you need to send 1,000 CRC to each masternode address in your local wallet, as generated in ***Step 3*** that you intend to operate. The transaction needs to be exactly ***1,000 CRC***. When you make this transaction, ensure that you factor in fees. The windows wallet will show you the total amount being deposited so ensure this reads excacly ***1,000 CRC***. Just to reiterate, you need to send exactly ***1,000 CRC*** in a single transaction to each masternode address that you intend to operate.

![send](https://i.imgur.com/YZGFNm7.jpg) 

***Step 6:***
> Record the transaction and output ID

The transaction and output ID from the deposit you made into your masternode public address will need to be added to the masternode configuration file later on. Fetching this information now will make things a bit easier when we reach that stage. To get the transaction and output ID, go to `Tools - Debug console`. In the debug console type `masternode outputs` and the transaction and output ID will be displayed. Record these details for later use.

![outputs](https://i.imgur.com/qAQdpsr.jpg)

***
### Part B: Creating the VPS within Aruba Cloud

***Step 1:*** 
> Register at [Aruba cloud](https://www.arubacloud.com/).

***Step 2:*** 
> After you have added funds to your account go [here](https://admin.dc1.arubacloud.com/Manage/Server/ServerCreation.aspx) to create your server.

![server-type](https://i.imgur.com/49Zi64S.jpg)

***Step 3:*** 
> Set a server ***hostname*** (name it whatever you want).

![server-hostname](https://i.imgur.com/hTRq7nY.jpg)

***Step 4:*** 
> Choose a server template: ***Ubuntu Server 16.0.4 LTS 64bit***

![server-template](https://i.imgur.com/olzP1oZ.jpg)

***Step 5:*** 
> Choose a ***root*** password.

![root-password](https://i.imgur.com/eUGDMj4.jpg)

***Step 6:*** 
> Choose a server size and select a Aruba Cloud datacenter: ***Random***
> ***Small 1.00 Euro/ month***

![server-size](https://i.imgur.com/WnrK06M.jpg)

***Step 7:***
> Click ***Create smart cloud server*** to create the server.

![server-create](https://i.imgur.com/W53ag8y.jpg)

***


### Part C: Connecting to the vps and installing the masternode script via Putty.

***Step 1***
> Download Putty [here](https://putty.org)

***Step 2***
> Copy your VPS IP (you can find this information in your Aruba Cloud control panel.

![putty-ip](https://i.imgur.com/896q0Kw.jpg)

***Step 3***
> Open Putty and fill in the ***hostname*** box with the IP of your VPS.

![putty-hostname](https://i.imgur.com/6kKzDEQ.jpg)

***Step 4***
> Type in ***root*** as the login/username.

***Step 5*** 
> Type in the root ***password*** into Putty.

***Step 6*** 
> Once you have clicked on open it will open a security alert: click ***yes***.  

***Step 7***
> Paste the code below into Putty to ***download*** the masternode install script.

```
wget -q https://raw.githubusercontent.com/crowdcoinChain/ScriptEasyInstall/master/cold_linux_easyinstall.sh
```

***Step 8***
> Paste the code below into Putty, then press ***enter*** to start the masternode installation.

```
bash cold_linux_easyinstall.sh
```

***Step 9***
> Wait for the installation to ***finish*** (this will take approximately 10-20 minutes)

***Step 10***
> When prompted enter your ***masternode genkey*** and press ***enter***. (you can copy/paste this information from your local wallet)

***Step 11***
* You will now see all of the relavant information for your server.
* Keep this terminal open as we will need the info for the local wallet setup.

![mn-finished](https://i.imgur.com/PqN0Z2o.jpg)

***

### Part D: Connecting & Starting the masternode 

***Step 1***
> Go to the tools tab within the local wallet and click on ***open masternode configuration file*** 

***Step 2***

The file will contain an example that is commented out (with a # in front).

> Create a new rule for your masternode:
 
* `ALIAS` : Any name can be given 
* `IP`    : The external IP address of your remote VPS.  
* `GENKEY`: The key you generated earlier when typing masternode genkey
 in the debug console.
* `TX`    : The long alphanumerical string when typing masternode outputs
 in the debug console.
* `ID`    : Is your outputidx when typing masternode outputs
 in the debug console.

Click ***File - Save***

***Example***

![mn-config](https://i.imgur.com/3j115NN.jpg)

***Step 3***
> Close your wallet and restart it.

Go to the ***Masternodes*** tab and inside that to the ***My Masternodes*** tab, select your new masternode and click on ***Start alias*** and it's status should change to ***PRE-ENABLED***. If you see ***WATCHDOG_EXPIRED*** don't worry, it takes a little for sentinel to send the correct status.

***Step 4***
> Check the status of your masternode within the VPS by using the command below:

```
crowdcoin-cli masternode status
```

You should now see ***Masternode successfully started*** 

![mn-started](https://i.imgur.com/mm3MM9q.jpg)

```
DONATION (CRC): CV8WdSZKp4rcTUxMLoPg8WcS1PdqEjgREV
```
```
DONATION (ETH): 0x06E4454CB946038E3252eD1d5B3fDafb85E089F5
```


***

### Part E: Frequently Asked Questions

> ***Q1: I’ve installed the Crowdcoin wallet, but where are my wallet data files?***

These are the default directories for the data directory:
* Mac: ~/Library/Application Support/Crowdcoincore
* Windows: C:\Users\YOUR_USERNAME\AppData\Roaming\Crowdcoincore  

> ***Q2: I have 1001 CRC, why is my masternode outputs blank?***

You need to create a new address in your wallet, label it, and send EXACTLY ***1000 CRC*** to your new address. Do NOT check the box that says ***Subtract fee from amount***

> ***Q3: How do i enable the masternodes tab?***

`Settings - Options - Wallets - Show Masternodes Tab`

> ***Q4: My masternode status is: WATCHDOG_EXPIRED***

Always confirm your wallet is up to date and synchronized first.
Confirm that Sentinel is installed on your server. If so, is this your very first reward cycle? Try waiting until the first payout. If it occurs again be aware that even in this status it should still be collecting rewards and will eventually correct itself.

> ***Q5: My masternode status is: NEW_START_REQUIRED***

Go to the ***Masternodes*** tab and inside that to the ***My Masternodes*** tab, select your new masternode and click on ***Start alias***

> ***Q6: My masternode status is: MISSING***

Either your wallet is not synchronized yet or a restart is required.
Note that even a dedicated server can go down from time to time. When this happens you need to restart your masternode. Also make sure you do not accidentally send any of the ***1000 CRC*** locked into your masternode, as that will disable it, forcing you to start over.

> ***Q7: My masternode is stuck on block 'xxx', how can i perform a reindex?***

```
systemctl stop crowdcoin.service
crowdcoind -daemon -reindex
crowdcoin-cli getinfo
```

Check the sync status with:

```
crowdcoin-cli mnsync status
```

You should now see ***MASTERNODE_SYNC_FINISHED***

> ***Q8: How many coins will i receive per day/week/month ?***

You can check all the current stats at https://masternodes.online/
