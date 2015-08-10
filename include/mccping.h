/**
* This file is: 
*
* Copyright (C) 2002 Stephen Makonin.
* All Rights Reserved.
*
*/

#ifndef _INC_MCCPING
#define _INC_MCCPING

///#ifdef  __cplusplus
///extern "C" {
///#endif

long _stdcall ping(
	char *error,	//must be a preallocated string about 256 characters 
	char *host);	//the host anme to ping
//RETURNS: 
//	number of msec the response was 
//	-1 if there is an error

///#ifdef  __cplusplus
///}
///#endif

#endif  /* _INC_MCCPING */