VERSION 5.00
Begin VB.Form frmCharInfo 
   BackColor       =   &H00000000&
   BorderStyle     =   5  'Sizable ToolWindow
   Caption         =   "Información del personaje"
   ClientHeight    =   6030
   ClientLeft      =   60
   ClientTop       =   225
   ClientWidth     =   6255
   ControlBox      =   0   'False
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6030
   ScaleWidth      =   6255
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton desc 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Peticion"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   2655
      MouseIcon       =   "frmCharInfo.frx":0000
      MousePointer    =   99  'Custom
      Style           =   1  'Graphical
      TabIndex        =   14
      Top             =   5625
      Width           =   1000
   End
   Begin VB.CommandButton Echar 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Echar"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   1395
      MouseIcon       =   "frmCharInfo.frx":0152
      MousePointer    =   99  'Custom
      Style           =   1  'Graphical
      TabIndex        =   13
      Top             =   5625
      Width           =   1000
   End
   Begin VB.CommandButton Aceptar 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Aceptar"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   5085
      MouseIcon       =   "frmCharInfo.frx":02A4
      MousePointer    =   99  'Custom
      Style           =   1  'Graphical
      TabIndex        =   12
      Top             =   5625
      Width           =   960
   End
   Begin VB.CommandButton Rechazar 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Rechazar"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3870
      MouseIcon       =   "frmCharInfo.frx":03F6
      MousePointer    =   99  'Custom
      Style           =   1  'Graphical
      TabIndex        =   11
      Top             =   5625
      Width           =   1000
   End
   Begin VB.CommandButton Command1 
      BackColor       =   &H00FFFFFF&
      Cancel          =   -1  'True
      Caption         =   "Cerrar"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   120
      MouseIcon       =   "frmCharInfo.frx":0548
      MousePointer    =   99  'Custom
      Style           =   1  'Graphical
      TabIndex        =   10
      Top             =   5625
      Width           =   1000
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00000000&
      Caption         =   "Clanes"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000E&
      Height          =   3120
      Left            =   135
      TabIndex        =   9
      Top             =   2355
      Width           =   6075
      Begin VB.TextBox txtMiembro 
         Appearance      =   0  'Flat
         BackColor       =   &H00404040&
         ForeColor       =   &H80000004&
         Height          =   1110
         Left            =   135
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   22
         Top             =   1800
         Width           =   5790
      End
      Begin VB.TextBox txtPeticiones 
         Appearance      =   0  'Flat
         BackColor       =   &H00404040&
         ForeColor       =   &H80000004&
         Height          =   1110
         Left            =   135
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   15
         Top             =   480
         Width           =   5790
      End
      Begin VB.Label lblMiembro 
         BackColor       =   &H00808080&
         Caption         =   "Ultimos clanes en los que participó:"
         ForeColor       =   &H8000000E&
         Height          =   255
         Left            =   135
         TabIndex        =   23
         Top             =   1620
         Width           =   2610
      End
      Begin VB.Label lblSolicitado 
         BackColor       =   &H00808080&
         Caption         =   "Ultimas membresías solicitadas:"
         ForeColor       =   &H8000000E&
         Height          =   255
         Left            =   135
         TabIndex        =   21
         Top             =   240
         Width           =   2265
      End
   End
   Begin VB.Frame charinfo 
      BackColor       =   &H00000000&
      Caption         =   "General"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000E&
      Height          =   2100
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   6075
      Begin VB.Label reputacion 
         BackColor       =   &H00000000&
         Caption         =   "Reputacion:"
         ForeColor       =   &H8000000E&
         Height          =   255
         Left            =   3060
         TabIndex        =   20
         Top             =   1560
         Width           =   2445
      End
      Begin VB.Label criminales 
         BackColor       =   &H00000000&
         Caption         =   "Criminales asesinados:"
         ForeColor       =   &H8000000E&
         Height          =   255
         Left            =   3060
         TabIndex        =   19
         Top             =   1325
         Width           =   2900
      End
      Begin VB.Label Ciudadanos 
         BackColor       =   &H00000000&
         Caption         =   "Ciudadanos asesinados:"
         ForeColor       =   &H8000000E&
         Height          =   255
         Left            =   3060
         TabIndex        =   18
         Top             =   1080
         Width           =   2850
      End
      Begin VB.Label ejercito 
         BackColor       =   &H00000000&
         Caption         =   "Faccion:"
         ForeColor       =   &H8000000E&
         Height          =   255
         Left            =   3060
         TabIndex        =   17
         Top             =   844
         Width           =   2880
      End
      Begin VB.Label guildactual 
         BackColor       =   &H00000000&
         Caption         =   "Clan Actual:"
         ForeColor       =   &H8000000E&
         Height          =   255
         Left            =   3030
         TabIndex        =   16
         Top             =   600
         Width           =   2880
      End
      Begin VB.Label status 
         BackColor       =   &H00000000&
         Caption         =   "Status:"
         ForeColor       =   &H8000000E&
         Height          =   255
         Left            =   3060
         TabIndex        =   8
         Top             =   1800
         Width           =   2760
      End
      Begin VB.Label Banco 
         BackColor       =   &H00000000&
         Caption         =   "Banco:"
         ForeColor       =   &H8000000E&
         Height          =   255
         Left            =   120
         TabIndex        =   7
         Top             =   1800
         Width           =   2985
      End
      Begin VB.Label Oro 
         BackColor       =   &H00000000&
         Caption         =   "Oro:"
         ForeColor       =   &H8000000E&
         Height          =   255
         Left            =   120
         TabIndex        =   6
         Top             =   1560
         Width           =   2805
      End
      Begin VB.Label Genero 
         BackColor       =   &H00000000&
         Caption         =   "Genero:"
         ForeColor       =   &H8000000E&
         Height          =   255
         Left            =   120
         TabIndex        =   5
         Top             =   1080
         Width           =   2895
      End
      Begin VB.Label Raza 
         BackColor       =   &H00000000&
         Caption         =   "Raza:"
         ForeColor       =   &H8000000E&
         Height          =   255
         Left            =   120
         TabIndex        =   4
         Top             =   600
         Width           =   2880
      End
      Begin VB.Label Clase 
         BackColor       =   &H00000000&
         Caption         =   "Clase:"
         ForeColor       =   &H8000000E&
         Height          =   255
         Left            =   120
         TabIndex        =   3
         Top             =   840
         Width           =   3270
      End
      Begin VB.Label Nivel 
         BackColor       =   &H00000000&
         Caption         =   "Nivel:"
         ForeColor       =   &H8000000E&
         Height          =   255
         Left            =   120
         TabIndex        =   2
         Top             =   1320
         Width           =   3105
      End
      Begin VB.Label Nombre 
         BackColor       =   &H00000000&
         Caption         =   "Nombre:"
         ForeColor       =   &H8000000E&
         Height          =   255
         Left            =   135
         TabIndex        =   1
         Top             =   360
         Width           =   5640
      End
   End
End
Attribute VB_Name = "frmCharInfo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


Option Explicit

Public frmmiembros As Boolean
Public frmsolicitudes As Boolean

Private Sub Aceptar_Click()
frmmiembros = False
frmsolicitudes = False
Call SendData("ACEPTARI" & Trim$(Right(Nombre, Len(Nombre) - 8)))
Unload frmGuildLeader
Call SendData("GLINFO")
Unload Me
End Sub

Private Sub Command1_Click()
Unload Me
End Sub


Public Sub parseCharInfo(ByVal Rdata As String)

If frmmiembros Then
    Rechazar.Visible = False
    Aceptar.Visible = False
    Echar.Visible = True
    desc.Visible = False
Else
    Rechazar.Visible = True
    Aceptar.Visible = True
    Echar.Visible = False
    desc.Visible = True
End If

'    tstr = Personaje & "Ź"1
'    tstr = tstr & GetVar(UserFile, "INIT", "Raza") & "Ź"2
'    tstr = tstr & GetVar(UserFile, "INIT", "Clase") & "Ź"3
'    tstr = tstr & GetVar(UserFile, "INIT", "Genero") & "Ź"4
'    tstr = tstr & GetVar(UserFile, "STATS", "ELV") & "Ź"5
'    tstr = tstr & GetVar(UserFile, "STATS", "GLD") & "Ź"6
'    tstr = tstr & GetVar(UserFile, "STATS", "Banco") & "Ź"7
'    tstr = tstr & GetVar(UserFile, "REP", "Promedio") & "Ź"8


Nombre.Caption = "Nombre: " & ReadField(1, Rdata, Asc("Ź"))
Raza.Caption = "Raza: " & ReadField(2, Rdata, Asc("Ź"))
Clase.Caption = "Clase: " & ReadField(3, Rdata, Asc("Ź"))
Genero.Caption = "Genero: " & ReadField(4, Rdata, Asc("Ź"))
Nivel.Caption = "Nivel: " & ReadField(5, Rdata, Asc("Ź"))
Oro.Caption = "Oro: " & ReadField(6, Rdata, Asc("Ź"))
Banco.Caption = "Banco: " & ReadField(7, Rdata, Asc("Ź"))
Me.reputacion.Caption = "Reputación: " & ReadField(8, Rdata, Asc("Ź"))


'    Peticiones = GetVar(UserFile, "GUILDS", "Pedidos")9
'    tstr = tstr & IIf(Len(Peticiones > 400), ".." & Right$(Peticiones, 400), Peticiones) & "Ź"
    
'    Miembro = GetVar(UserFile, "GUILDS", "Miembro")10
'    tstr = tstr & IIf(Len(Miembro) > 400, ".." & Right$(Miembro, 400), Miembro) & "Ź"

Me.txtPeticiones.Text = ReadField(9, Rdata, Asc("Ź"))
Me.txtMiembro.Text = ReadField(10, Rdata, Asc("Ź"))


'GuildActual = val(GetVar(UserFile, "GUILD", "GuildIndex"))11
Me.guildactual.Caption = "Clan: " & ReadField(11, Rdata, Asc("Ź"))


'    tstr = tstr & GetVar(UserFile, "FACCIONES", "EjercitoReal") & "Ź"12
'    tstr = tstr & GetVar(UserFile, "FACCIONES", "EjercitoCaos") & "Ź"13
'    tstr = tstr & GetVar(UserFile, "FACCIONES", "CiudMatados") & "Ź"14
'    tstr = tstr & GetVar(UserFile, "FACCIONES", "CrimMatados") & "Ź"15

Me.ejercito.Caption = "Ejército: " & IIf(Val(ReadField(12, Rdata, Asc("Ź"))) <> 0, "Armada Real", IIf(Val(ReadField(13, Rdata, Asc("Ź"))) <> 0, "Legión Oscura", "-"))

Ciudadanos.Caption = "Ciudadanos asesinados: " & ReadField(14, Rdata, Asc("Ź"))
criminales.Caption = "Criminales asesinados: " & ReadField(15, Rdata, Asc("Ź"))


status.Caption = IIf(Val(ReadField(8, Rdata, Asc("Ź"))) > 0, " (Ciudadano)", " (Criminal)")
status.ForeColor = IIf(Val(ReadField(8, Rdata, Asc("Ź"))) > 0, vbBlue, vbRed)
Me.Show vbModeless, frmMain


End Sub

Private Sub desc_Click()
Call SendData("ENVCOMEN" & Right(Nombre, Len(Nombre) - 7))
End Sub

Private Sub Echar_Click()
Call SendData("ECHARCLA" & Right(Nombre, Len(Nombre) - 7))
frmmiembros = False
frmsolicitudes = False
Unload frmGuildLeader
Call SendData("GLINFO")
Unload Me
End Sub




Private Sub Rechazar_Click()
Load frmCommet
frmCommet.T = RECHAZOPJ
frmCommet.Nombre = Right$(Nombre, Len(Nombre) - 7)
frmCommet.Caption = "Ingrese motivo para rechazo"
frmCommet.Show vbModeless, frmCharInfo

End Sub

