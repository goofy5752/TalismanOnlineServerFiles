Talisman Online Private Server Setup Guide
==========================================

![image](https://github.com/user-attachments/assets/d7784dd1-48ce-4084-83c3-ba549d08e247)


This guide will walk you through setting up the Talisman Online Private Server on **Ubuntu 20.04**. Could you follow each step carefully? If you’re interested in custom events—such as **Last Man Standing**, **Guild Battle Royale**, and many more—please contact me for details!

* * *

1\. Update the System and Install Git
---------------------------------

**What this does:**  
Updates your package lists and installs Git to clone the server files repository.

`sudo apt-get update`

`sudo apt-get install git -y`

* * *

2\. Clone the Repository
------------------------

**What this does:**  
Clones the repository containing the server files and moves its contents to your home directory.

`git clone https://github.com/goofy5752/TalismanOnlinePrivateServerFiles.git`

* * *

3\. Install Wget
----------------

**What this does:**  
Installs `wget`, a tool for downloading files from the internet (needed for the MySQL configuration file).

`sudo apt install wget -y`

* * *

4\. Configure and Install MySQL 5.7
-----------------------------------

**What this does:**  
Downloads the MySQL APT configuration package, sets up the MySQL repository and installs MySQL Server 5.7 along with the required client packages.

**Step 1: You can download and install the MySQL repository using the command below:**

`wget https://dev.mysql.com/get/mysql-apt-config_0.8.12-1_all.deb`

`sudo dpkg -i mysql-apt-config_0.8.12-1_all.deb`

Once you are done with the installation you will see a prompt in which you have to choose "ubuntu bionic"

![image](https://github.com/user-attachments/assets/f4362c28-0e09-46e0-baad-486cb0da60d5)

**Step 2: The options below will show MySQL 8.0 as the default option. Click on the first option and press enter**


![image](https://github.com/user-attachments/assets/ac1b9aa1-1baa-4ee2-b522-7137475915b6)

**Step 3: Upon clicking on the first option, you can then change the mysql server and cluster you want installed. Click on MySQL 5.7 and press enter:**

![image](https://github.com/user-attachments/assets/ebbf0647-b656-4992-921b-674c59b7d858)


**Step 4: MySQL 5.7 should now be selected as your default … navigate to the “OK” button and click**

**Step 5: Update all your repositories**

`sudo apt-get update`

**Step 6: Run the command below :**

`sudo apt-cache policy mysql-server`

Your result should contain MySQL 5.7 as seen below:

![image](https://github.com/user-attachments/assets/57f3137e-33a8-49d9-9359-770de6a10866)

If your result does not contain MySQL 5.* it means that your update from step 6 failed and because of that, MySQL 5.7 was not added to the cache.

Try running the update command again :

`sudo apt update`

You would notice that the MySQL bionic InRelease package failed to update:

![image](https://github.com/user-attachments/assets/abea60b9-5995-435f-9ea2-f1347d44d423)

If this is the case, there is workaround for this:

`sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B7B3B788A8D3785C`

to import the missing gpg key so that your system can update securely.

after which you then try to update once again:

`sudo apt update`

**Step 7: At this point, you have the mysql 5.7 repository in your system so you can now proceed to install it**

`sudo apt install -f mysql-client=5.7* mysql-community-server=5.7* mysql-server=5.7*`

Press Y to begin the installation.
Set the root password for your mysql when the prompt comes up.

To check your MySQL version, run:

`mysql --version`

To login to your SQL DB, run:

`mysql -u root -p`

**Important Note: The public key might have changed by the time you are reading this article from B7B3B788A8D3785C to something else, in that case you have just to replace the key with the newly changed**

* * *

5\. Install 32-bit Libraries and Additional Dependencies
--------------------------------------------------------

**What this does:**  
Install necessary 32-bit libraries and dependencies to ensure compatibility with any 32-bit binaries in the server.


`sudo apt install lib32stdc++6`

`sudo apt install libstdc++6`

`sudo dpkg --add-architecture i386`

`sudo apt update` 

`sudo apt install libc6:i386 zlib1g:i386`

`sudo apt --fix-broken install`

* * *

6\. Install Server Packages (.deb Files)
----------------------------------------

**What this does:**  
Installs any Debian packages provided in the repository and resolves any dependency issues.


`sudo dpkg -i *.deb`

`sudo apt-get -f install`

* * *

7\. Install and Configure Screen
--------------------------------

**What this does:**  
Installs Screen, a terminal multiplexer, which allows you to run server processes in the background.


`sudo apt-get install screen -y`

* * *

8\. Disable the Firewall
------------------------

**What this does:**  
Disables Ubuntu’s UFW firewall. _(Note: This step is needed and without it it will result in "Acquiring Server Ip Adress" error.)_


`sudo ufw disable`

* * *

9\. Configure the Database
--------------------------

**What this does:**  
Opens the MySQL shell and inserts some initial accounts into your `db_account` database. Modify or add entries as needed.

1.  Open the MySQL shell:
    
    `sudo mysql -u root -p`

    then you enter your password
    
3.  In the MySQL prompt, run:
    
`USE db_account;`

`INSERT INTO t_account (name, pwd, pw2, pv) VALUES  ('testaccount', '3fc0a7acf087f549ac2b266baf94b8b1', 'qwerty123', 9), ('testaccount1', '3fc0a7acf087f549ac2b266baf94b8b1', 'qwerty123', 9), ('testaccount2', '3fc0a7acf087f549ac2b266baf94b8b1', 'qwerty123', 9), ('testaccount3', '3fc0a7acf087f549ac2b266baf94b8b1', 'qwerty123', 9);`

* * *

Final Notes
-----------

*   **Ubuntu Version:** Ensure you’re running **Ubuntu 20.04**.
*   **Configuration Files:** Remember to update all .INI files in the folders and replace them with your IP address and DB passwords.
*   **Custom Events:** If you’re interested in custom events like **Last Man Standing**, **Guild Battle Royale**, and more, please contact me for further details.
*   **Support:** For additional help or to report issues, please open an issue on the repository or reach out directly.

* * *

Happy gaming and enjoy your Talisman Online Private Server!
