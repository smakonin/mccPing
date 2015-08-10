Attribute VB_Name = "mccPing"
Option Explicit

Declare Function ping Lib "mccping.dll" (ByVal error As String, ByVal host As String) As Long

'PARAMS:
'	error	-	must be a preallocated string about 256 characters
'	host	-	the host anme to ping
'
'RETURNS: 
'	number of msec the response was 
'	-1 if there is an error

