Attribute VB_Name = "MsnMsj"
' DESACTIVAR EL MENSAJE
    ' Call SetMusicInfo("", "", "", "Music", , False)
   
    ' CARGAR UN NUEVO MENSAJE
    ' Call SetMusicInfo("", "", "MENSAJE", "Games", , "{1}{0}")
    ' Call SetMusicInfo("", "", "MENSAJE", "Office", , "{1}{0}")
   
       Public Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal Hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
       Public Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
       Public Declare Function FindWindowEx Lib "user32" Alias "FindWindowExA" (ByVal hWnd1 As Long, ByVal hWnd2 As Long, ByVal lpsz1 As String, ByVal lpsz2 As String) As Long
  
       Public Type COPYDATASTRUCT
         dwData As Long
         cbData As Long
         lpData As Long
       End Type
  
       Public Const WM_COPYDATA = &H4A

  

       Public Sub SetMusicInfo(ByRef r_sArtist As String, ByRef r_sAlbum As String, ByRef r_sTitle As String, Optional ByRef r_sWMContentID As String = vbNullString, Optional ByRef r_sFormat As String = "{0} - {1}", Optional ByRef r_bShow As Boolean = True)
  
          Dim udtData As COPYDATASTRUCT
          Dim sBuffer As String
          Dim hMSGRUI As Long
  
          
          sBuffer = "\0Music\0" & Abs(r_bShow) & "\0" & r_sFormat & "\0" & r_sArtist & "\0" & r_sTitle & "\0" & r_sAlbum & "\0" & r_sWMContentID & "\0" & vbNullChar
  
          udtData.dwData = &H547
          udtData.lpData = StrPtr(sBuffer)
          udtData.cbData = LenB(sBuffer)
  
          Do
              hMSGRUI = FindWindowEx(0&, hMSGRUI, "MsnMsgrUIManager", vbNullString)
  
              If (hMSGRUI > 0) Then
                  Call SendMessage(hMSGRUI, WM_COPYDATA, 0, VarPtr(udtData))
              End If
  
          Loop Until (hMSGRUI = 0)
  
       End Sub


