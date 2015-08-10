VERSION 5.00
Begin VB.Form frmPing 
   Caption         =   "Form1"
   ClientHeight    =   1965
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6690
   LinkTopic       =   "Form1"
   ScaleHeight     =   1965
   ScaleWidth      =   6690
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text2 
      Height          =   1215
      Left            =   60
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   2
      Top             =   600
      Width           =   6495
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Ping"
      Height          =   435
      Left            =   4380
      TabIndex        =   1
      Top             =   60
      Width           =   2175
   End
   Begin VB.TextBox Text3 
      Height          =   312
      Left            =   1200
      TabIndex        =   0
      Top             =   120
      Width           =   3015
   End
   Begin VB.Label Label1 
      Caption         =   "Host:"
      Height          =   255
      Left            =   60
      TabIndex        =   3
      Top             =   180
      Width           =   1995
   End
End
Attribute VB_Name = "frmPing"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Command1_Click()
    Dim sError As String
    Dim sHost As String
    Dim lReturn As LogModeConstants
    
    Screen.MousePointer = vbHourglass
    
    sError = String(256, " ")
    sHost = CStr(Text3.Text)
    
    lReturn = ping(sError, sHost)
    
    If lReturn = -1 Then
        Text2.Text = "ERROR: " & sError
    Else
        Text2.Text = "Server Up ( " & lReturn & " msec.)"
    End If
        
    Screen.MousePointer = vbDefault
End Sub
