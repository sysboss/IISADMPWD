IISADMPWD
=========
This application is actually a useful utility for domain users to manage user passwords via IIS web portal, based on Windows Server 2003 IISADMPWD.  
The IISADMPWD function is deprecated since IIS 6 and not longer available under a clean install Windows Server.

### Installation ###
Here are some quick workaround steps to install IISADMPWD on Windows Server 2008/2012+.  
  
1. Copy the folder 'iisadmpwd' from this repo to:
   C:\Windows\system32\inetsrv\Iisadmpwd on your server.

2. Register the IISpwchg.dll file in the Iisadmpwd directory:
	* Open an elevated command prompt.
	* In the Open box, type the following, and then press ENTER:  
> regsvr32 c:\windows\system32\inetsrv\iisadmpwd\iispwchg.dll

3.  Configure the **PasswordChangeFlags** property in the metabase to make sure that the Password Change functionality is enabled:

	* Open an elevated command prompt.

	* Locate the C:\Inetpub\Adminscripts directory (make sure that you have IIS 6 Scripting Tools feature turned on).

  * Type the following command, and then press ENTER:  
> cscript.exe adsutil.vbs set w3svc/passwordchangeflags Value

```
Note In this sample command, Value is a placeholder for the value that you want to set for the PasswordChangeFlags property.
```

4.  The following list includes the possible values for the PasswordChangeFlags property. You can use a combination of these values.

·       0: This is the default value. This value indicates that you must use a Secure Sockets Layer (SSL) connection when you change the password.

·       1: This value permits password changes on non-secure ports. This value is useful if SSL is not enabled.

·       2: This value disables the Password Change functionality.

·       4: This value disables the advance notification of password expiration.

 

5.   To create an application for the Iisadmpwd directory.
	* Now open IIS Manager, and in the left panel right click on Default Web Site node.
  * Choose Add Application. In this dialog, type an alias (I use IISADMPWD) and the path (C:\Windows\system32\inetsrv\Iisadmpwd). Then click Select... button to choose a suitable application pool. (Remember that you can refer to Tony's article  for details.) Click OK twice and we are done.

 
Now you can access the password change page by navigating to http://<server>/iisadmpwd/ (or https, which depends on your choice in step 4).

### Sidenote ###
If you only owns a copy of x86 Server 2003 while the target Server 2008/2012 you are using is x64, then the above steps need a few changes. First, you must copy the folder 'SysWOW64\inetsrv' from this repo to %windir%\SysWOW64\inetsrv on your server. This path will be used in following steps. At last this application must be running in a 32-bit application pool.

// Article based on http://blogs.msdn.com/b/asiatech/archive/2009/03/17/how-to-manage-my-windows-user-password-through-iis-web-portal.aspx
