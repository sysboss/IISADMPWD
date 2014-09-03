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
```regsvr32 c:\windows\system32\inetsrv\iisadmpwd\iispwchg.dll```
