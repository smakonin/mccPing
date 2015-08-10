/**
* This file is: 
*
* Copyright (C) 2002 Stephen Makonin.
* All Rights Reserved.
*
*/

#include <winsock.h>
#include <string.h>
#include "ipexport.h"
#include "icmpapi.h"

#define PING_TIMEOUT 5000

#define VB_TRUE  1
#define VB_FALSE 0

long _stdcall ping(char *error, char *host)
{
	IPAddr ip;
	WORD w = MAKEWORD(1,1);
	WSADATA wsadata;

	strset(error, 0);
	
	WSAStartup(w, &wsadata);
	
	hostent* phostent;
	if( host[0] <= '9')
		ip = (IPAddr)inet_addr(host);
	else
	{
		phostent = gethostbyname(host);
		if(!phostent)
		{
			strcpy(error, "Unable to resolve host name.");
			return -1;
		}
		ip = *(DWORD*)(*phostent->h_addr_list);
	}
	
	HANDLE icmphandle = IcmpCreateFile();
	
	char reply[sizeof(icmp_echo_reply)+8];
	
	icmp_echo_reply* iep = (icmp_echo_reply*)&reply;
	iep->RoundTripTime = 0xffffffff;
	
	IcmpSendEcho(icmphandle,ip,0,0,NULL,reply,sizeof(icmp_echo_reply)+8,PING_TIMEOUT);
	
	IcmpCloseHandle(icmphandle);
	
	WSACleanup();

	if(iep->RoundTripTime == PING_TIMEOUT)
	{
		strcpy(error, "Timeout.");
		return -1;
	}

	return iep->RoundTripTime;
}




