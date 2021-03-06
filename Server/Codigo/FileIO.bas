Attribute VB_Name = "ES"

Option Explicit

Public Sub CargarSpawnList()
    Dim n As Integer, LoopC As Integer
    n = val(GetVar(App.Path & "\Dat\Invokar.dat", "INIT", "NumNPCs"))
    ReDim SpawnList(n) As tCriaturasEntrenador
    For LoopC = 1 To n
        SpawnList(LoopC).NpcIndex = val(GetVar(App.Path & "\Dat\Invokar.dat", "LIST", "NI" & LoopC))
        SpawnList(LoopC).NpcName = GetVar(App.Path & "\Dat\Invokar.dat", "LIST", "NN" & LoopC)
    Next LoopC
    
End Sub

Function EsAdmin(ByVal name As String) As Boolean
Dim NumWizs As Integer
Dim WizNum As Integer
Dim NomB As String

NumWizs = val(GetVar(IniPath & "Server.ini", "INIT", "Admines"))

For WizNum = 1 To NumWizs
    NomB = UCase$(GetVar(IniPath & "Server.ini", "Admines", "Admin" & WizNum))
    If Left(NomB, 1) = "*" Or Left(NomB, 1) = "+" Then NomB = Right(NomB, Len(NomB) - 1)
    If UCase$(name) = NomB Then
        EsAdmin = True
        Exit Function
    End If
Next WizNum
EsAdmin = False

End Function

Function EsDios(ByVal name As String) As Boolean
Dim NumWizs As Integer
Dim WizNum As Integer
Dim NomB As String

NumWizs = val(GetVar(IniPath & "Server.ini", "INIT", "Dioses"))
For WizNum = 1 To NumWizs
    NomB = UCase$(GetVar(IniPath & "Server.ini", "Dioses", "Dios" & WizNum))
    If Left(NomB, 1) = "*" Or Left(NomB, 1) = "+" Then NomB = Right(NomB, Len(NomB) - 1)
    If UCase$(name) = NomB Then
        EsDios = True
        Exit Function
    End If
Next WizNum
EsDios = False
End Function

Function EsSemiDios(ByVal name As String) As Boolean
Dim NumWizs As Integer
Dim WizNum As Integer
Dim NomB As String

NumWizs = val(GetVar(IniPath & "Server.ini", "INIT", "SemiDioses"))
For WizNum = 1 To NumWizs
    NomB = UCase$(GetVar(IniPath & "Server.ini", "SemiDioses", "SemiDios" & WizNum))
    If Left(NomB, 1) = "*" Or Left(NomB, 1) = "+" Then NomB = Right(NomB, Len(NomB) - 1)
    If UCase$(name) = NomB Then
        EsSemiDios = True
        Exit Function
    End If
Next WizNum
EsSemiDios = False

End Function

Function EsConsejero(ByVal name As String) As Boolean
Dim NumWizs As Integer
Dim WizNum As Integer
Dim NomB As String

NumWizs = val(GetVar(IniPath & "Server.ini", "INIT", "Consejeros"))
For WizNum = 1 To NumWizs
    NomB = UCase$(GetVar(IniPath & "Server.ini", "Consejeros", "Consejero" & WizNum))
    If Left(NomB, 1) = "*" Or Left(NomB, 1) = "+" Then NomB = Right(NomB, Len(NomB) - 1)
    If UCase$(name) = NomB Then
        EsConsejero = True
        Exit Function
    End If
Next WizNum
EsConsejero = False
End Function

Function EsRolesMaster(ByVal name As String) As Boolean
Dim NumWizs As Integer
Dim WizNum As Integer
Dim NomB As String

NumWizs = val(GetVar(IniPath & "Server.ini", "INIT", "RolesMasters"))
For WizNum = 1 To NumWizs
    NomB = UCase$(GetVar(IniPath & "Server.ini", "RolesMasters", "RM" & WizNum))
    If Left(NomB, 1) = "*" Or Left(NomB, 1) = "+" Then NomB = Right(NomB, Len(NomB) - 1)
    If UCase$(name) = NomB Then
        EsRolesMaster = True
        Exit Function
    End If
Next WizNum
EsRolesMaster = False
End Function


Public Function TxtDimension(ByVal name As String) As Long
Dim n As Integer, cad As String, Tam As Long
n = FreeFile(1)
Open name For Input As #n
Tam = 0
Do While Not EOF(n)
    Tam = Tam + 1
    Line Input #n, cad
Loop
Close n
TxtDimension = Tam
End Function

Public Sub CargarForbidenWords()
ReDim ForbidenNames(1 To TxtDimension(DatPath & "NombresInvalidos.txt"))
Dim n As Integer, i As Integer
n = FreeFile(1)
Open DatPath & "NombresInvalidos.txt" For Input As #n

For i = 1 To UBound(ForbidenNames)
    Line Input #n, ForbidenNames(i)
Next i

Close n

End Sub

Public Sub CargarHechizos()

'###################################################
'#               ATENCION PELIGRO                  #
'###################################################
'
'  ???? NO USAR GetVar PARA LEER Hechizos.dat !!!!
'
'El que ose desafiar esta LEY, se las tendr? que ver
'con migo. Para leer Hechizos.dat se deber? usar
'la nueva clase clsLeerInis.
'
'Alejo
'
'###################################################

On Error GoTo errhandler

If frmMain.Visible Then frmMain.txStatus.caption = "Cargando Hechizos."

Dim Hechizo As Integer
Dim Leer As New clsIniReader

Call Leer.Initialize(DatPath & "Hechizos.dat")

'obtiene el numero de hechizos
NumeroHechizos = val(Leer.GetValue("INIT", "NumeroHechizos"))
ReDim Hechizos(1 To NumeroHechizos) As tHechizo

frmCargando.cargar.min = 0
frmCargando.cargar.max = NumeroHechizos
frmCargando.cargar.value = 0

'Llena la lista
For Hechizo = 1 To NumeroHechizos

    Hechizos(Hechizo).nombre = Leer.GetValue("Hechizo" & Hechizo, "Nombre")
    Hechizos(Hechizo).Desc = Leer.GetValue("Hechizo" & Hechizo, "Desc")
    Hechizos(Hechizo).PalabrasMagicas = Leer.GetValue("Hechizo" & Hechizo, "PalabrasMagicas")
    
    Hechizos(Hechizo).HechizeroMsg = Leer.GetValue("Hechizo" & Hechizo, "HechizeroMsg")
    Hechizos(Hechizo).TargetMsg = Leer.GetValue("Hechizo" & Hechizo, "TargetMsg")
    Hechizos(Hechizo).PropioMsg = Leer.GetValue("Hechizo" & Hechizo, "PropioMsg")
    
    Hechizos(Hechizo).Tipo = val(Leer.GetValue("Hechizo" & Hechizo, "Tipo"))
    Hechizos(Hechizo).WAV = val(Leer.GetValue("Hechizo" & Hechizo, "WAV"))
    Hechizos(Hechizo).FXgrh = val(Leer.GetValue("Hechizo" & Hechizo, "Fxgrh"))
    
    Hechizos(Hechizo).loops = val(Leer.GetValue("Hechizo" & Hechizo, "Loops"))
    
    Hechizos(Hechizo).Resis = val(Leer.GetValue("Hechizo" & Hechizo, "Resis"))
    
    Hechizos(Hechizo).SubeHP = val(Leer.GetValue("Hechizo" & Hechizo, "SubeHP"))
    Hechizos(Hechizo).MinHP = val(Leer.GetValue("Hechizo" & Hechizo, "MinHP"))
    Hechizos(Hechizo).MaxHP = val(Leer.GetValue("Hechizo" & Hechizo, "MaxHP"))
    
    Hechizos(Hechizo).SubeMana = val(Leer.GetValue("Hechizo" & Hechizo, "SubeMana"))
    Hechizos(Hechizo).MiMana = val(Leer.GetValue("Hechizo" & Hechizo, "MinMana"))
    Hechizos(Hechizo).MaMana = val(Leer.GetValue("Hechizo" & Hechizo, "MaxMana"))
    
    Hechizos(Hechizo).SubeSta = val(Leer.GetValue("Hechizo" & Hechizo, "SubeSta"))
    Hechizos(Hechizo).MinSta = val(Leer.GetValue("Hechizo" & Hechizo, "MinSta"))
    Hechizos(Hechizo).MaxSta = val(Leer.GetValue("Hechizo" & Hechizo, "MaxSta"))
    
    Hechizos(Hechizo).SubeHam = val(Leer.GetValue("Hechizo" & Hechizo, "SubeHam"))
    Hechizos(Hechizo).MinHam = val(Leer.GetValue("Hechizo" & Hechizo, "MinHam"))
    Hechizos(Hechizo).MaxHam = val(Leer.GetValue("Hechizo" & Hechizo, "MaxHam"))
    
    Hechizos(Hechizo).SubeSed = val(Leer.GetValue("Hechizo" & Hechizo, "SubeSed"))
    Hechizos(Hechizo).MinSed = val(Leer.GetValue("Hechizo" & Hechizo, "MinSed"))
    Hechizos(Hechizo).MaxSed = val(Leer.GetValue("Hechizo" & Hechizo, "MaxSed"))
    
    Hechizos(Hechizo).SubeAgilidad = val(Leer.GetValue("Hechizo" & Hechizo, "SubeAG"))
    Hechizos(Hechizo).MinAgilidad = val(Leer.GetValue("Hechizo" & Hechizo, "MinAG"))
    Hechizos(Hechizo).MaxAgilidad = val(Leer.GetValue("Hechizo" & Hechizo, "MaxAG"))
    
    Hechizos(Hechizo).SubeFuerza = val(Leer.GetValue("Hechizo" & Hechizo, "SubeFU"))
    Hechizos(Hechizo).MinFuerza = val(Leer.GetValue("Hechizo" & Hechizo, "MinFU"))
    Hechizos(Hechizo).MaxFuerza = val(Leer.GetValue("Hechizo" & Hechizo, "MaxFU"))
    
    Hechizos(Hechizo).SubeCarisma = val(Leer.GetValue("Hechizo" & Hechizo, "SubeCA"))
    Hechizos(Hechizo).MinCarisma = val(Leer.GetValue("Hechizo" & Hechizo, "MinCA"))
    Hechizos(Hechizo).MaxCarisma = val(Leer.GetValue("Hechizo" & Hechizo, "MaxCA"))
    
    
    Hechizos(Hechizo).Invisibilidad = val(Leer.GetValue("Hechizo" & Hechizo, "Invisibilidad"))
    Hechizos(Hechizo).Paraliza = val(Leer.GetValue("Hechizo" & Hechizo, "Paraliza"))
    Hechizos(Hechizo).Inmoviliza = val(Leer.GetValue("Hechizo" & Hechizo, "Inmoviliza"))
    Hechizos(Hechizo).RemoverParalisis = val(Leer.GetValue("Hechizo" & Hechizo, "RemoverParalisis"))
    Hechizos(Hechizo).RemoverEstupidez = val(Leer.GetValue("Hechizo" & Hechizo, "RemoverEstupidez"))
    Hechizos(Hechizo).RemoverEstupidez = val(Leer.GetValue("Hechizo" & Hechizo, "RemoverEstupidez"))
    Hechizos(Hechizo).RemueveInvisibilidadParcial = val(Leer.GetValue("Hechizo" & Hechizo, "RemueveInvisibilidadParcial"))
    
    
    Hechizos(Hechizo).CuraVeneno = val(Leer.GetValue("Hechizo" & Hechizo, "CuraVeneno"))
    Hechizos(Hechizo).Envenena = val(Leer.GetValue("Hechizo" & Hechizo, "Envenena"))
    Hechizos(Hechizo).Maldicion = val(Leer.GetValue("Hechizo" & Hechizo, "Maldicion"))
    Hechizos(Hechizo).RemoverMaldicion = val(Leer.GetValue("Hechizo" & Hechizo, "RemoverMaldicion"))
    Hechizos(Hechizo).Bendicion = val(Leer.GetValue("Hechizo" & Hechizo, "Bendicion"))
    Hechizos(Hechizo).Revivir = val(Leer.GetValue("Hechizo" & Hechizo, "Revivir"))
    
    Hechizos(Hechizo).Ceguera = val(Leer.GetValue("Hechizo" & Hechizo, "Ceguera"))
    Hechizos(Hechizo).Estupidez = val(Leer.GetValue("Hechizo" & Hechizo, "Estupidez"))
    
    Hechizos(Hechizo).invoca = val(Leer.GetValue("Hechizo" & Hechizo, "Invoca"))
    Hechizos(Hechizo).NumNpc = val(Leer.GetValue("Hechizo" & Hechizo, "NumNpc"))
    Hechizos(Hechizo).Cant = val(Leer.GetValue("Hechizo" & Hechizo, "Cant"))
    Hechizos(Hechizo).Mimetiza = val(Leer.GetValue("hechizo" & Hechizo, "Mimetiza"))
    
    
    Hechizos(Hechizo).Materializa = val(Leer.GetValue("Hechizo" & Hechizo, "Materializa"))
    Hechizos(Hechizo).ItemIndex = val(Leer.GetValue("Hechizo" & Hechizo, "ItemIndex"))
    
    Hechizos(Hechizo).MinSkill = val(Leer.GetValue("Hechizo" & Hechizo, "MinSkill"))
    Hechizos(Hechizo).ManaRequerido = val(Leer.GetValue("Hechizo" & Hechizo, "ManaRequerido"))
    
    'Barrin 30/9/03
    Hechizos(Hechizo).StaRequerido = val(Leer.GetValue("Hechizo" & Hechizo, "StaRequerido"))
    
    Hechizos(Hechizo).Target = val(Leer.GetValue("Hechizo" & Hechizo, "Target"))
    frmCargando.cargar.value = frmCargando.cargar.value + 1
    
    Hechizos(Hechizo).NeedStaff = val(Leer.GetValue("Hechizo" & Hechizo, "NeedStaff"))
    Hechizos(Hechizo).StaffAffected = CBool(val(Leer.GetValue("Hechizo" & Hechizo, "StaffAffected")))
    
Next Hechizo

Set Leer = Nothing
Exit Sub

errhandler:
 MsgBox "Error cargando hechizos.dat " & Err.Number & ": " & Err.Description
 
End Sub

Sub LoadMotd()
Dim i As Integer

MaxLines = val(GetVar(App.Path & "\Dat\Motd.ini", "INIT", "NumLines"))
ReDim MOTD(1 To MaxLines)
For i = 1 To MaxLines
    MOTD(i).texto = GetVar(App.Path & "\Dat\Motd.ini", "Motd", "Line" & i)
    MOTD(i).Formato = ""
Next i

End Sub

Public Sub DoBackUp()
'Call LogTarea("Sub DoBackUp")
haciendoBK = True
Dim i As Integer



' Lo saco porque elimina elementales y mascotas - Maraxus
''''''''''''''lo pongo aca x sugernecia del yind
'For i = 1 To LastNPC
'    If Npclist(i).flags.NPCActive Then
'        If Npclist(i).Contadores.TiempoExistencia > 0 Then
'            Call MuereNpc(i, 0)
'        End If
'    End If
'Next i
'''''''''''/'lo pongo aca x sugernecia del yind



Call SendData(SendTarget.toAll, 0, 0, "BKW")


Call LimpiarObjs
Call WorldSave
Call modGuilds.v_RutinaElecciones
' Call ActualizarRanking





Call SendData(SendTarget.toAll, 0, 0, "BKW")

'Call EstadisticasWeb.Informar(EVENTO_NUEVO_CLAN, 0)

haciendoBK = False

'Log
On Error Resume Next
Dim nfile As Integer
nfile = FreeFile ' obtenemos un canal
Open App.Path & "\logs\BackUps.log" For Append Shared As #nfile
Print #nfile, Date & " " & Time
Close #nfile
End Sub

Public Sub GrabarMapa(ByVal Map As Long, ByVal MAPFILE As String)
On Error Resume Next
    Dim FreeFileMap As Long
    Dim FreeFileInf As Long
    Dim Y As Long
    Dim x As Long
    Dim ByFlags As Byte
    Dim TempInt As Integer
    Dim LoopC As Long
    
    If FileExist(MAPFILE & ".map", vbNormal) Then
        Kill MAPFILE & ".map"
    End If
    
    If FileExist(MAPFILE & ".inf", vbNormal) Then
        Kill MAPFILE & ".inf"
    End If
    
    'Open .map file
    FreeFileMap = FreeFile
    Open MAPFILE & ".Map" For Binary As FreeFileMap
    Seek FreeFileMap, 1
    
    'Open .inf file
    FreeFileInf = FreeFile
    Open MAPFILE & ".Inf" For Binary As FreeFileInf
    Seek FreeFileInf, 1
    'map Header
            
    Put FreeFileMap, , MapInfo(Map).MapVersion
    Put FreeFileMap, , MiCabecera
    Put FreeFileMap, , TempInt
    Put FreeFileMap, , TempInt
    Put FreeFileMap, , TempInt
    Put FreeFileMap, , TempInt
    
    'inf Header
    Put FreeFileInf, , TempInt
    Put FreeFileInf, , TempInt
    Put FreeFileInf, , TempInt
    Put FreeFileInf, , TempInt
    Put FreeFileInf, , TempInt
    
    'Write .map file
    For Y = YMinMapSize To YMaxMapSize
        For x = XMinMapSize To XMaxMapSize
            
                ByFlags = 0
                
                If MapData(Map, x, Y).Blocked Then ByFlags = ByFlags Or 1
                If MapData(Map, x, Y).Graphic(2) Then ByFlags = ByFlags Or 2
                If MapData(Map, x, Y).Graphic(3) Then ByFlags = ByFlags Or 4
                If MapData(Map, x, Y).Graphic(4) Then ByFlags = ByFlags Or 8
                If MapData(Map, x, Y).trigger Then ByFlags = ByFlags Or 16
                
                Put FreeFileMap, , ByFlags
                
                Put FreeFileMap, , MapData(Map, x, Y).Graphic(1)
                
                For LoopC = 2 To 4
                    If MapData(Map, x, Y).Graphic(LoopC) Then _
                        Put FreeFileMap, , MapData(Map, x, Y).Graphic(LoopC)
                Next LoopC
                
                If MapData(Map, x, Y).trigger Then _
                    Put FreeFileMap, , CInt(MapData(Map, x, Y).trigger)
                
                '.inf file
                
                ByFlags = 0
                
                If MapData(Map, x, Y).OBJInfo.ObjIndex > 0 Then
                   If ObjData(MapData(Map, x, Y).OBJInfo.ObjIndex).OBJType = eOBJType.otFogata Then
                        MapData(Map, x, Y).OBJInfo.ObjIndex = 0
                        MapData(Map, x, Y).OBJInfo.Amount = 0
                    End If
                End If
    
                If MapData(Map, x, Y).TileExit.Map Then ByFlags = ByFlags Or 1
                If MapData(Map, x, Y).NpcIndex Then ByFlags = ByFlags Or 2
                If MapData(Map, x, Y).OBJInfo.ObjIndex Then ByFlags = ByFlags Or 4
                
                Put FreeFileInf, , ByFlags
                
                If MapData(Map, x, Y).TileExit.Map Then
                    Put FreeFileInf, , MapData(Map, x, Y).TileExit.Map
                    Put FreeFileInf, , MapData(Map, x, Y).TileExit.x
                    Put FreeFileInf, , MapData(Map, x, Y).TileExit.Y
                End If
                
                If MapData(Map, x, Y).NpcIndex Then _
                    Put FreeFileInf, , Npclist(MapData(Map, x, Y).NpcIndex).Numero
                
                If MapData(Map, x, Y).OBJInfo.ObjIndex Then
                    Put FreeFileInf, , MapData(Map, x, Y).OBJInfo.ObjIndex
                    Put FreeFileInf, , MapData(Map, x, Y).OBJInfo.Amount
                End If
            
            
        Next x
    Next Y
    
    'Close .map file
    Close FreeFileMap

    'Close .inf file
    Close FreeFileInf

    'write .dat file
    Call WriteVar(MAPFILE & ".dat", "Mapa" & Map, "Name", MapInfo(Map).name)
    Call WriteVar(MAPFILE & ".dat", "Mapa" & Map, "MusicNum", MapInfo(Map).Music)
    Call WriteVar(MAPFILE & ".dat", "mapa" & Map, "MagiaSinefecto", MapInfo(Map).MagiaSinEfecto)
    Call WriteVar(MAPFILE & ".dat", "Mapa" & Map, "StartPos", MapInfo(Map).StartPos.Map & "-" & MapInfo(Map).StartPos.x & "-" & MapInfo(Map).StartPos.Y)

    Call WriteVar(MAPFILE & ".dat", "Mapa" & Map, "Terreno", MapInfo(Map).Terreno)
    Call WriteVar(MAPFILE & ".dat", "Mapa" & Map, "Zona", MapInfo(Map).Zona)
    Call WriteVar(MAPFILE & ".dat", "Mapa" & Map, "Restringir", MapInfo(Map).Restringir)
    Call WriteVar(MAPFILE & ".dat", "Mapa" & Map, "BackUp", str(MapInfo(Map).BackUp))

    If MapInfo(Map).Pk Then
        Call WriteVar(MAPFILE & ".dat", "Mapa" & Map, "Pk", "0")
    Else
        Call WriteVar(MAPFILE & ".dat", "Mapa" & Map, "Pk", "1")
    End If

End Sub
Sub LoadArmasHerreria()

Dim n As Integer, lc As Integer

n = val(GetVar(DatPath & "ArmasHerrero.dat", "INIT", "NumArmas"))

ReDim Preserve ArmasHerrero(1 To n) As Integer

For lc = 1 To n
    ArmasHerrero(lc) = val(GetVar(DatPath & "ArmasHerrero.dat", "Arma" & lc, "Index"))
Next lc

End Sub

Sub LoadArmadurasHerreria()

Dim n As Integer, lc As Integer

n = val(GetVar(DatPath & "ArmadurasHerrero.dat", "INIT", "NumArmaduras"))

ReDim Preserve ArmadurasHerrero(1 To n) As Integer

For lc = 1 To n
    ArmadurasHerrero(lc) = val(GetVar(DatPath & "ArmadurasHerrero.dat", "Armadura" & lc, "Index"))
Next lc

End Sub

Sub LoadObjCarpintero()

Dim n As Integer, lc As Integer

n = val(GetVar(DatPath & "ObjCarpintero.dat", "INIT", "NumObjs"))

ReDim Preserve ObjCarpintero(1 To n) As Integer

For lc = 1 To n
    ObjCarpintero(lc) = val(GetVar(DatPath & "ObjCarpintero.dat", "Obj" & lc, "Index"))
Next lc

End Sub



Sub LoadOBJData()

'###################################################
'#               ATENCION PELIGRO                  #
'###################################################
'
'???? NO USAR GetVar PARA LEER DESDE EL OBJ.DAT !!!!
'
'El que ose desafiar esta LEY, se las tendr? que ver
'con migo. Para leer desde el OBJ.DAT se deber? usar
'la nueva clase clsLeerInis.
'
'Alejo
'
'###################################################

'Call LogTarea("Sub LoadOBJData")

On Error GoTo errhandler

If frmMain.Visible Then frmMain.txStatus.caption = "Cargando base de datos de los objetos."

'*****************************************************************
'Carga la lista de objetos
'*****************************************************************
Dim Object As Integer
Dim Leer As New clsIniReader

Call Leer.Initialize(DatPath & "Obj.dat")

'obtiene el numero de obj
NumObjDatas = val(Leer.GetValue("INIT", "NumObjs"))

frmCargando.cargar.min = 0
frmCargando.cargar.max = NumObjDatas
frmCargando.cargar.value = 0


ReDim Preserve ObjData(1 To NumObjDatas) As ObjData
  
'Llena la lista
For Object = 1 To NumObjDatas
        
    ObjData(Object).name = Leer.GetValue("OBJ" & Object, "Name")
    
    ObjData(Object).GrhIndex = val(Leer.GetValue("OBJ" & Object, "GrhIndex"))
    If ObjData(Object).GrhIndex = 0 Then
        ObjData(Object).GrhIndex = ObjData(Object).GrhIndex
    End If
    
    ObjData(Object).OBJType = val(Leer.GetValue("OBJ" & Object, "ObjType"))
    
    ObjData(Object).Newbie = val(Leer.GetValue("OBJ" & Object, "Newbie"))
    
    Select Case ObjData(Object).OBJType
        Case eOBJType.otArmadura
            ObjData(Object).Real = val(Leer.GetValue("OBJ" & Object, "Real"))
            ObjData(Object).Caos = val(Leer.GetValue("OBJ" & Object, "Caos"))
            ObjData(Object).LingH = val(Leer.GetValue("OBJ" & Object, "LingH"))
            ObjData(Object).LingP = val(Leer.GetValue("OBJ" & Object, "LingP"))
            ObjData(Object).LingO = val(Leer.GetValue("OBJ" & Object, "LingO"))
            ObjData(Object).SkHerreria = val(Leer.GetValue("OBJ" & Object, "SkHerreria"))
        
        Case eOBJType.otESCUDO
            ObjData(Object).ShieldAnim = val(Leer.GetValue("OBJ" & Object, "Anim"))
            ObjData(Object).LingH = val(Leer.GetValue("OBJ" & Object, "LingH"))
            ObjData(Object).LingP = val(Leer.GetValue("OBJ" & Object, "LingP"))
            ObjData(Object).LingO = val(Leer.GetValue("OBJ" & Object, "LingO"))
            ObjData(Object).SkHerreria = val(Leer.GetValue("OBJ" & Object, "SkHerreria"))
            ObjData(Object).Real = val(Leer.GetValue("OBJ" & Object, "Real"))
            ObjData(Object).Caos = val(Leer.GetValue("OBJ" & Object, "Caos"))
        
        Case eOBJType.otCASCO
            ObjData(Object).CascoAnim = val(Leer.GetValue("OBJ" & Object, "Anim"))
            ObjData(Object).LingH = val(Leer.GetValue("OBJ" & Object, "LingH"))
            ObjData(Object).LingP = val(Leer.GetValue("OBJ" & Object, "LingP"))
            ObjData(Object).LingO = val(Leer.GetValue("OBJ" & Object, "LingO"))
            ObjData(Object).SkHerreria = val(Leer.GetValue("OBJ" & Object, "SkHerreria"))
            ObjData(Object).Real = val(Leer.GetValue("OBJ" & Object, "Real"))
            ObjData(Object).Caos = val(Leer.GetValue("OBJ" & Object, "Caos"))
            
                   
        
        Case eOBJType.otWeapon
            ObjData(Object).WeaponAnim = val(Leer.GetValue("OBJ" & Object, "Anim"))
            ObjData(Object).Apu?ala = val(Leer.GetValue("OBJ" & Object, "Apu?ala"))
            ObjData(Object).Pegadoble = val(Leer.GetValue("OBJ" & Object, "PegaDoble"))
            ObjData(Object).DosManos = val(Leer.GetValue("OBJ" & Object, "DosManos"))
            ObjData(Object).Envenena = val(Leer.GetValue("OBJ" & Object, "Envenena"))
            ObjData(Object).MaxHIT = val(Leer.GetValue("OBJ" & Object, "MaxHIT"))
            ObjData(Object).MinHIT = val(Leer.GetValue("OBJ" & Object, "MinHIT"))
            ObjData(Object).proyectil = val(Leer.GetValue("OBJ" & Object, "Proyectil"))
            ObjData(Object).Municion = val(Leer.GetValue("OBJ" & Object, "Municiones"))
            ObjData(Object).StaffPower = val(Leer.GetValue("OBJ" & Object, "StaffPower"))
            ObjData(Object).StaffDamageBonus = val(Leer.GetValue("OBJ" & Object, "StaffDamageBonus"))
            ObjData(Object).VaraDragon = val(Leer.GetValue("OBJ" & Object, "VaraDragon"))
          
            ObjData(Object).Refuerzo = val(Leer.GetValue("OBJ" & Object, "Refuerzo"))
            
            ObjData(Object).LingH = val(Leer.GetValue("OBJ" & Object, "LingH"))
            ObjData(Object).LingP = val(Leer.GetValue("OBJ" & Object, "LingP"))
            ObjData(Object).LingO = val(Leer.GetValue("OBJ" & Object, "LingO"))
            ObjData(Object).SkHerreria = val(Leer.GetValue("OBJ" & Object, "SkHerreria"))
            ObjData(Object).Real = val(Leer.GetValue("OBJ" & Object, "Real"))
            ObjData(Object).Caos = val(Leer.GetValue("OBJ" & Object, "Caos"))
        
        Case eOBJType.otHerramientas
            ObjData(Object).LingH = val(Leer.GetValue("OBJ" & Object, "LingH"))
            ObjData(Object).LingP = val(Leer.GetValue("OBJ" & Object, "LingP"))
            ObjData(Object).LingO = val(Leer.GetValue("OBJ" & Object, "LingO"))
            ObjData(Object).SkHerreria = val(Leer.GetValue("OBJ" & Object, "SkHerreria"))
        
        Case eOBJType.otInstrumentos
            ObjData(Object).Snd1 = val(Leer.GetValue("OBJ" & Object, "SND1"))
            ObjData(Object).Snd2 = val(Leer.GetValue("OBJ" & Object, "SND2"))
            ObjData(Object).Snd3 = val(Leer.GetValue("OBJ" & Object, "SND3"))
        
        Case eOBJType.otMinerales
            ObjData(Object).MinSkill = val(Leer.GetValue("OBJ" & Object, "MinSkill"))
        
        Case eOBJType.otPuertas, eOBJType.otBotellaVacia, eOBJType.otBotellaLlena
            ObjData(Object).IndexAbierta = val(Leer.GetValue("OBJ" & Object, "IndexAbierta"))
            ObjData(Object).IndexCerrada = val(Leer.GetValue("OBJ" & Object, "IndexCerrada"))
            ObjData(Object).IndexCerradaLlave = val(Leer.GetValue("OBJ" & Object, "IndexCerradaLlave"))
        
        Case otPociones
            ObjData(Object).TipoPocion = val(Leer.GetValue("OBJ" & Object, "TipoPocion"))
            ObjData(Object).MaxModificador = val(Leer.GetValue("OBJ" & Object, "MaxModificador"))
            ObjData(Object).MinModificador = val(Leer.GetValue("OBJ" & Object, "MinModificador"))
            ObjData(Object).DuracionEfecto = val(Leer.GetValue("OBJ" & Object, "DuracionEfecto"))
        
        Case eOBJType.otBarcos
            ObjData(Object).MinSkill = val(Leer.GetValue("OBJ" & Object, "MinSkill"))
            ObjData(Object).MaxHIT = val(Leer.GetValue("OBJ" & Object, "MaxHIT"))
            ObjData(Object).MinHIT = val(Leer.GetValue("OBJ" & Object, "MinHIT"))
        
        Case eOBJType.otFlechas
            ObjData(Object).MaxHIT = val(Leer.GetValue("OBJ" & Object, "MaxHIT"))
            ObjData(Object).MinHIT = val(Leer.GetValue("OBJ" & Object, "MinHIT"))
            ObjData(Object).Envenena = val(Leer.GetValue("OBJ" & Object, "Envenena"))
            ObjData(Object).Paraliza = val(Leer.GetValue("OBJ" & Object, "Paraliza"))
    End Select
    
    ObjData(Object).Ropaje = val(Leer.GetValue("OBJ" & Object, "NumRopaje"))
    ObjData(Object).HechizoIndex = val(Leer.GetValue("OBJ" & Object, "HechizoIndex"))
    
    ObjData(Object).LingoteIndex = val(Leer.GetValue("OBJ" & Object, "LingoteIndex"))
    
    ObjData(Object).MineralIndex = val(Leer.GetValue("OBJ" & Object, "MineralIndex"))
    
    ObjData(Object).MaxHP = val(Leer.GetValue("OBJ" & Object, "MaxHP"))
    ObjData(Object).MinHP = val(Leer.GetValue("OBJ" & Object, "MinHP"))
    
    ObjData(Object).Mujer = val(Leer.GetValue("OBJ" & Object, "Mujer"))
    ObjData(Object).Hombre = val(Leer.GetValue("OBJ" & Object, "Hombre"))
    
    ObjData(Object).MinHam = val(Leer.GetValue("OBJ" & Object, "MinHam"))
    ObjData(Object).MinSed = val(Leer.GetValue("OBJ" & Object, "MinAgu"))
    
    ObjData(Object).MinDef = val(Leer.GetValue("OBJ" & Object, "MINDEF"))
    ObjData(Object).MaxDef = val(Leer.GetValue("OBJ" & Object, "MAXDEF"))
    
    ObjData(Object).RazaEnana = val(Leer.GetValue("OBJ" & Object, "RazaEnana"))
    
    ObjData(Object).Valor = val(Leer.GetValue("OBJ" & Object, "Valor"))
    
    ObjData(Object).Crucial = val(Leer.GetValue("OBJ" & Object, "Crucial"))
    
    ObjData(Object).Cerrada = val(Leer.GetValue("OBJ" & Object, "abierta"))
    If ObjData(Object).Cerrada = 1 Then
        ObjData(Object).Llave = val(Leer.GetValue("OBJ" & Object, "Llave"))
        ObjData(Object).clave = val(Leer.GetValue("OBJ" & Object, "Clave"))
    End If
    
    'Puertas y llaves
    ObjData(Object).clave = val(Leer.GetValue("OBJ" & Object, "Clave"))
    
    ObjData(Object).texto = Leer.GetValue("OBJ" & Object, "Texto")
    ObjData(Object).GrhSecundario = val(Leer.GetValue("OBJ" & Object, "VGrande"))
    
    ObjData(Object).Agarrable = val(Leer.GetValue("OBJ" & Object, "Agarrable"))
    ObjData(Object).ForoID = Leer.GetValue("OBJ" & Object, "ID")
    
    Dim i As Integer
    For i = 1 To NUMCLASES
        ObjData(Object).ClaseProhibida(i) = Leer.GetValue("OBJ" & Object, "CP" & i)
    Next i
    
    ObjData(Object).DefensaMagicaMax = val(Leer.GetValue("OBJ" & Object, "DefensaMagicaMax"))
    ObjData(Object).DefensaMagicaMin = val(Leer.GetValue("OBJ" & Object, "DefensaMagicaMin"))
    
    ObjData(Object).SkCarpinteria = val(Leer.GetValue("OBJ" & Object, "SkCarpinteria"))
    
    If ObjData(Object).SkCarpinteria > 0 Then _
        ObjData(Object).Madera = val(Leer.GetValue("OBJ" & Object, "Madera"))
    
    'Bebidas
    ObjData(Object).MinSta = val(Leer.GetValue("OBJ" & Object, "MinST"))
    
    ObjData(Object).NoSeCae = val(Leer.GetValue("OBJ" & Object, "NoSeCae"))
    
    frmCargando.cargar.value = frmCargando.cargar.value + 1
Next Object

Set Leer = Nothing

Exit Sub

errhandler:
    MsgBox "error cargando objetos " & Err.Number & ": " & Err.Description


End Sub

Sub LoadUserStats(ByVal userindex As Integer, ByRef UserFile As clsIniReader)
On Error Resume Next
Dim LoopC As Integer


For LoopC = 1 To NUMATRIBUTOS
  UserList(userindex).Stats.UserAtributos(LoopC) = CInt(UserFile.GetValue("ATRIBUTOS", "AT" & LoopC))
  UserList(userindex).Stats.UserAtributosBackUP(LoopC) = UserList(userindex).Stats.UserAtributos(LoopC)
Next LoopC

For LoopC = 1 To NUMSKILLS
  UserList(userindex).Stats.UserSkills(LoopC) = CInt(UserFile.GetValue("SKILLS", "SK" & LoopC))
Next LoopC

For LoopC = 1 To MAXUSERHECHIZOS
  UserList(userindex).Stats.UserHechizos(LoopC) = CInt(UserFile.GetValue("Hechizos", "H" & LoopC))
Next LoopC

UserList(userindex).Stats.GLD = CLng(UserFile.GetValue("STATS", "GLD"))
UserList(userindex).Stats.Banco = CLng(UserFile.GetValue("STATS", "BANCO"))

UserList(userindex).Stats.MET = CInt(UserFile.GetValue("STATS", "MET"))
UserList(userindex).Stats.MaxHP = CInt(UserFile.GetValue("STATS", "MaxHP"))
UserList(userindex).Stats.MinHP = CInt(UserFile.GetValue("STATS", "MinHP"))

UserList(userindex).Stats.MinSta = CInt(UserFile.GetValue("STATS", "MinSTA"))
UserList(userindex).Stats.MaxSta = CInt(UserFile.GetValue("STATS", "MaxSTA"))
UserList(userindex).Stats.TrofOro = CInt(UserFile.GetValue("STATS", "TrofOro"))
UserList(userindex).Stats.TrofBronce = CInt(UserFile.GetValue("STATS", "TrofBronce"))
UserList(userindex).Stats.TrofPlata = CInt(UserFile.GetValue("STATS", "TrofPlata"))
UserList(userindex).Stats.TrofMadera = CInt(UserFile.GetValue("STATS", "TrofMadera"))
UserList(userindex).Stats.MaxMAN = CInt(UserFile.GetValue("STATS", "MaxMAN"))
UserList(userindex).Stats.MinMAN = CInt(UserFile.GetValue("STATS", "MinMAN"))

' puntos
UserList(userindex).Stats.PuntosDeath = CInt(UserFile.GetValue("STATS", "PuntosDeath"))
UserList(userindex).Stats.PuntosDuelos = CInt(UserFile.GetValue("STATS", "PuntosDuelos"))
UserList(userindex).Stats.PuntosTorneo = CInt(UserFile.GetValue("STATS", "PuntosTorneo"))
UserList(userindex).Stats.PuntosRetos = CInt(UserFile.GetValue("STATS", "PuntosRetos"))
UserList(userindex).Stats.PuntosPlante = CInt(UserFile.GetValue("STATS", "PuntosPlante"))
UserList(userindex).Stats.PuntosCanje = CInt(UserFile.GetValue("STATS", "PuntosCanje"))

UserList(userindex).Stats.MaxHIT = CInt(UserFile.GetValue("STATS", "MaxHIT"))
UserList(userindex).Stats.MinHIT = CInt(UserFile.GetValue("STATS", "MinHIT"))

UserList(userindex).Stats.MaxAGU = CInt(UserFile.GetValue("STATS", "MaxAGU"))
UserList(userindex).Stats.MinAGU = CInt(UserFile.GetValue("STATS", "MinAGU"))

UserList(userindex).Stats.MaxHam = CInt(UserFile.GetValue("STATS", "MaxHAM"))
UserList(userindex).Stats.MinHam = CInt(UserFile.GetValue("STATS", "MinHAM"))

UserList(userindex).Stats.SkillPts = CInt(UserFile.GetValue("STATS", "SkillPtsLibres"))

UserList(userindex).Stats.Exp = CDbl(UserFile.GetValue("STATS", "EXP"))
UserList(userindex).Stats.ELU = CLng(UserFile.GetValue("STATS", "ELU"))
UserList(userindex).Stats.ELV = CLng(UserFile.GetValue("STATS", "ELV"))


UserList(userindex).Stats.UsuariosMatados = CInt(UserFile.GetValue("MUERTES", "UserMuertes"))
UserList(userindex).Stats.CriminalesMatados = CInt(UserFile.GetValue("MUERTES", "CrimMuertes"))
UserList(userindex).Stats.NPCsMuertos = CInt(UserFile.GetValue("MUERTES", "NpcsMuertes"))

UserList(userindex).flags.PertAlCons = CByte(UserFile.GetValue("CONSEJO", "PERTENECE"))
UserList(userindex).flags.PertAlConsCaos = CByte(UserFile.GetValue("CONSEJO", "PERTENECECAOS"))
UserList(userindex).flags.Silenciado = CByte(UserFile.GetValue("FLAGS", "Silenciado"))


End Sub

Sub LoadUserReputacion(ByVal userindex As Integer, ByRef UserFile As clsIniReader)

UserList(userindex).Reputacion.AsesinoRep = CDbl(UserFile.GetValue("REP", "Asesino"))
UserList(userindex).Reputacion.BandidoRep = CDbl(UserFile.GetValue("REP", "Bandido"))
UserList(userindex).Reputacion.BurguesRep = CDbl(UserFile.GetValue("REP", "Burguesia"))
UserList(userindex).Reputacion.LadronesRep = CDbl(UserFile.GetValue("REP", "Ladrones"))
UserList(userindex).Reputacion.NobleRep = CDbl(UserFile.GetValue("REP", "Nobles"))
UserList(userindex).Reputacion.PlebeRep = CDbl(UserFile.GetValue("REP", "Plebe"))
UserList(userindex).Reputacion.Promedio = CDbl(UserFile.GetValue("REP", "Promedio"))

End Sub

Sub LoadUserInit(ByVal userindex As Integer, ByRef UserFile As clsIniReader)

Dim LoopC As Long
Dim ln As String

UserList(userindex).Faccion.ArmadaReal = CByte(UserFile.GetValue("FACCIONES", "EjercitoReal"))
UserList(userindex).Faccion.FuerzasCaos = CByte(UserFile.GetValue("FACCIONES", "EjercitoCaos"))
UserList(userindex).Faccion.CiudadanosMatados = CDbl(UserFile.GetValue("FACCIONES", "CiudMatados"))
UserList(userindex).Faccion.CriminalesMatados = CDbl(UserFile.GetValue("FACCIONES", "CrimMatados"))
UserList(userindex).Faccion.RecibioArmaduraCaos = CByte(UserFile.GetValue("FACCIONES", "rArCaos"))
UserList(userindex).Faccion.RecibioArmaduraReal = CByte(UserFile.GetValue("FACCIONES", "rArReal"))
UserList(userindex).Faccion.RecibioExpInicialCaos = CByte(UserFile.GetValue("FACCIONES", "rExCaos"))
UserList(userindex).Faccion.RecibioExpInicialReal = CByte(UserFile.GetValue("FACCIONES", "rExReal"))
UserList(userindex).Faccion.RecompensasCaos = CLng(UserFile.GetValue("FACCIONES", "recCaos"))
UserList(userindex).Faccion.RecompensasReal = CLng(UserFile.GetValue("FACCIONES", "recReal"))
UserList(userindex).Faccion.Reenlistadas = CByte(UserFile.GetValue("FACCIONES", "Reenlistadas"))

UserList(userindex).flags.Muerto = CByte(UserFile.GetValue("FLAGS", "Muerto"))
UserList(userindex).flags.Escondido = CByte(UserFile.GetValue("FLAGS", "Escondido"))

UserList(userindex).flags.Hambre = CByte(UserFile.GetValue("FLAGS", "Hambre"))
UserList(userindex).flags.Sed = CByte(UserFile.GetValue("FLAGS", "Sed"))
UserList(userindex).flags.Desnudo = CByte(UserFile.GetValue("FLAGS", "Desnudo"))

UserList(userindex).flags.Envenenado = CByte(UserFile.GetValue("FLAGS", "Envenenado"))
UserList(userindex).flags.Paralizado = CByte(UserFile.GetValue("FLAGS", "Paralizado"))
If UserList(userindex).flags.Paralizado = 1 Then
    UserList(userindex).Counters.Paralisis = IntervaloParalizado
End If
UserList(userindex).flags.Navegando = CByte(UserFile.GetValue("FLAGS", "Navegando"))


UserList(userindex).Counters.Pena = CLng(UserFile.GetValue("COUNTERS", "Pena"))

UserList(userindex).email = UserFile.GetValue("CONTACTO", "Email")

UserList(userindex).Genero = UserFile.GetValue("INIT", "Genero")
UserList(userindex).Clase = UserFile.GetValue("INIT", "Clase")
UserList(userindex).Raza = UserFile.GetValue("INIT", "Raza")
UserList(userindex).Hogar = UserFile.GetValue("INIT", "Hogar")
UserList(userindex).char.Heading = CInt(UserFile.GetValue("INIT", "Heading"))


UserList(userindex).OrigChar.Head = CInt(UserFile.GetValue("INIT", "Head"))
UserList(userindex).OrigChar.Body = CInt(UserFile.GetValue("INIT", "Body"))
UserList(userindex).OrigChar.WeaponAnim = CInt(UserFile.GetValue("INIT", "Arma"))
UserList(userindex).OrigChar.ShieldAnim = CInt(UserFile.GetValue("INIT", "Escudo"))
UserList(userindex).OrigChar.CascoAnim = CInt(UserFile.GetValue("INIT", "Casco"))
UserList(userindex).OrigChar.Alas = val(UserFile.GetValue("INIT", "Alas"))
UserList(userindex).OrigChar.Heading = eHeading.SOUTH

If UserList(userindex).flags.Muerto = 0 Then
    UserList(userindex).char = UserList(userindex).OrigChar
Else
    UserList(userindex).char.Body = iCuerpoMuerto
    UserList(userindex).char.Head = iCabezaMuerto
    UserList(userindex).char.WeaponAnim = NingunArma
    UserList(userindex).char.ShieldAnim = NingunEscudo
    UserList(userindex).char.CascoAnim = NingunCasco

End If


UserList(userindex).Desc = UserFile.GetValue("INIT", "Desc")
UserList(userindex).Titulo = UserFile.GetValue("INIT", "Titulo")
' soporte
UserList(userindex).Pregunta = UserFile.GetValue("INIT", "Pregunta")
UserList(userindex).Respuesta = UserFile.GetValue("INIT", "Respuesta")

UserList(userindex).pos.Map = CInt(ReadField(1, UserFile.GetValue("INIT", "Position"), 45))
UserList(userindex).pos.x = CInt(ReadField(2, UserFile.GetValue("INIT", "Position"), 45))
UserList(userindex).pos.Y = CInt(ReadField(3, UserFile.GetValue("INIT", "Position"), 45))

UserList(userindex).Invent.NroItems = CInt(UserFile.GetValue("Inventory", "CantidadItems"))

'[KEVIN]--------------------------------------------------------------------
'***********************************************************************************
UserList(userindex).BancoInvent.NroItems = CInt(UserFile.GetValue("BancoInventory", "CantidadItems"))
'Lista de objetos del banco
For LoopC = 1 To MAX_BANCOINVENTORY_SLOTS
    ln = UserFile.GetValue("BancoInventory", "Obj" & LoopC)
    UserList(userindex).BancoInvent.Object(LoopC).ObjIndex = CInt(ReadField(1, ln, 45))
    UserList(userindex).BancoInvent.Object(LoopC).Amount = CInt(ReadField(2, ln, 45))
Next LoopC
'------------------------------------------------------------------------------------
'[/KEVIN]*****************************************************************************


'Lista de objetos
For LoopC = 1 To MAX_INVENTORY_SLOTS
    ln = UserFile.GetValue("Inventory", "Obj" & LoopC)
    UserList(userindex).Invent.Object(LoopC).ObjIndex = CInt(ReadField(1, ln, 45))
    UserList(userindex).Invent.Object(LoopC).Amount = CInt(ReadField(2, ln, 45))
    UserList(userindex).Invent.Object(LoopC).Equipped = CByte(ReadField(3, ln, 45))
Next LoopC

'Obtiene el indice-objeto del arma
UserList(userindex).Invent.WeaponEqpSlot = val(UserFile.GetValue("Inventory", "WeaponEqpSlot"))
If UserList(userindex).Invent.WeaponEqpSlot > 0 Then
    UserList(userindex).Invent.WeaponEqpObjIndex = UserList(userindex).Invent.Object(UserList(userindex).Invent.WeaponEqpSlot).ObjIndex
End If

'Obtiene el indice-objeto del arma
UserList(userindex).Invent.AlaEqpSlot = val(UserFile.GetValue("Inventory", "AlaEqpSlot"))
If UserList(userindex).Invent.AlaEqpSlot > 0 Then
    UserList(userindex).Invent.AlaEqpObjIndex = UserList(userindex).Invent.Object(UserList(userindex).Invent.AlaEqpSlot).ObjIndex
End If

'Obtiene el indice-objeto del armadura
UserList(userindex).Invent.ArmourEqpSlot = val(UserFile.GetValue("Inventory", "ArmourEqpSlot"))
If UserList(userindex).Invent.ArmourEqpSlot > 0 Then
    UserList(userindex).Invent.ArmourEqpObjIndex = UserList(userindex).Invent.Object(UserList(userindex).Invent.ArmourEqpSlot).ObjIndex
    UserList(userindex).flags.Desnudo = 0
Else
    UserList(userindex).flags.Desnudo = 1
End If

'Obtiene el indice-objeto del escudo
UserList(userindex).Invent.EscudoEqpSlot = CByte(UserFile.GetValue("Inventory", "EscudoEqpSlot"))
If UserList(userindex).Invent.EscudoEqpSlot > 0 Then
    UserList(userindex).Invent.EscudoEqpObjIndex = UserList(userindex).Invent.Object(UserList(userindex).Invent.EscudoEqpSlot).ObjIndex
End If

'Obtiene el indice-objeto del casco
UserList(userindex).Invent.CascoEqpSlot = CByte(UserFile.GetValue("Inventory", "CascoEqpSlot"))
If UserList(userindex).Invent.CascoEqpSlot > 0 Then
    UserList(userindex).Invent.CascoEqpObjIndex = UserList(userindex).Invent.Object(UserList(userindex).Invent.CascoEqpSlot).ObjIndex
End If

'Obtiene el indice-objeto barco
UserList(userindex).Invent.BarcoSlot = CByte(UserFile.GetValue("Inventory", "BarcoSlot"))
If UserList(userindex).Invent.BarcoSlot > 0 Then
    UserList(userindex).Invent.BarcoObjIndex = UserList(userindex).Invent.Object(UserList(userindex).Invent.BarcoSlot).ObjIndex
End If

'Obtiene el indice-objeto municion
UserList(userindex).Invent.MunicionEqpSlot = CByte(UserFile.GetValue("Inventory", "MunicionSlot"))
If UserList(userindex).Invent.MunicionEqpSlot > 0 Then
    UserList(userindex).Invent.MunicionEqpObjIndex = UserList(userindex).Invent.Object(UserList(userindex).Invent.MunicionEqpSlot).ObjIndex
End If

'[Alejo]
'Obtiene el indice-objeto herramienta
UserList(userindex).Invent.HerramientaEqpSlot = CInt(UserFile.GetValue("Inventory", "HerramientaSlot"))
If UserList(userindex).Invent.HerramientaEqpSlot > 0 Then
    UserList(userindex).Invent.HerramientaEqpObjIndex = UserList(userindex).Invent.Object(UserList(userindex).Invent.HerramientaEqpSlot).ObjIndex
End If

UserList(userindex).NroMacotas = 0

ln = UserFile.GetValue("Guild", "GUILDINDEX")
If IsNumeric(ln) Then
    UserList(userindex).GuildIndex = CInt(ln)
Else
    UserList(userindex).GuildIndex = 0
End If

End Sub

Function GetVar(ByVal file As String, ByVal Main As String, ByVal Var As String, Optional EmptySpaces As Long = 1024) As String

Dim sSpaces As String ' This will hold the input that the program will retrieve
Dim szReturn As String ' This will be the defaul value if the string is not found
  
szReturn = ""
  
sSpaces = Space$(EmptySpaces) ' This tells the computer how long the longest string can be
  
  
GetPrivateProfileString Main, Var, szReturn, sSpaces, EmptySpaces, file
  
GetVar = RTrim$(sSpaces)
GetVar = Left$(GetVar, Len(GetVar) - 1)
  
End Function

Sub CargarBackUp()

If frmMain.Visible Then frmMain.txStatus.caption = "Cargando backup."

Dim Map As Integer
Dim TempInt As Integer
Dim tFileName As String
Dim npcfile As String

On Error GoTo man
    
    NumMaps = val(GetVar(DatPath & "Map.dat", "INIT", "NumMaps"))
    Call InitAreas
    
    frmCargando.cargar.min = 0
    frmCargando.cargar.max = NumMaps
    frmCargando.cargar.value = 0
    
    MapPath = GetVar(DatPath & "Map.dat", "INIT", "MapPath")
    
    
    ReDim MapData(1 To NumMaps, XMinMapSize To XMaxMapSize, YMinMapSize To YMaxMapSize) As MapBlock
    ReDim MapInfo(1 To NumMaps) As MapInfo
      
    For Map = 1 To NumMaps
        
        If val(GetVar(App.Path & MapPath & "Mapa" & Map & ".Dat", "Mapa" & Map, "BackUp")) <> 0 Then
            tFileName = App.Path & "\WorldBackUp\Mapa" & Map
        Else
            tFileName = App.Path & MapPath & "Mapa" & Map
        End If
        
        Call CargarMapa(Map, tFileName)
        
        frmCargando.cargar.value = frmCargando.cargar.value + 1
        DoEvents
    Next Map

Exit Sub

man:
    MsgBox ("Error durante la carga de mapas, el mapa " & Map & " contiene errores")
    Call LogError(Date & " " & Err.Description & " " & Err.HelpContext & " " & Err.HelpFile & " " & Err.Source)
 
End Sub

Sub LoadMapData()

If frmMain.Visible Then frmMain.txStatus.caption = "Cargando mapas..."

Dim Map As Integer
Dim TempInt As Integer
Dim tFileName As String
Dim npcfile As String

On Error GoTo man
    
    NumMaps = val(GetVar(DatPath & "Map.dat", "INIT", "NumMaps"))
    Call InitAreas
    
    frmCargando.cargar.min = 0
    frmCargando.cargar.max = NumMaps
    frmCargando.cargar.value = 0
    
    MapPath = GetVar(DatPath & "Map.dat", "INIT", "MapPath")
    
    
    ReDim MapData(1 To NumMaps, XMinMapSize To XMaxMapSize, YMinMapSize To YMaxMapSize) As MapBlock
    ReDim MapInfo(1 To NumMaps) As MapInfo
      
    For Map = 1 To NumMaps
        
        tFileName = App.Path & MapPath & "Mapa" & Map
        Call CargarMapa(Map, tFileName)
        
        frmCargando.cargar.value = frmCargando.cargar.value + 1
        DoEvents
    Next Map

Exit Sub

man:
    MsgBox ("Error durante la carga de mapas, el mapa " & Map & " contiene errores")
    Call LogError(Date & " " & Err.Description & " " & Err.HelpContext & " " & Err.HelpFile & " " & Err.Source)

End Sub

Public Sub CargarMapa(ByVal Map As Long, ByVal MAPFl As String)
On Error GoTo errh
    Dim FreeFileMap As Long
    Dim FreeFileInf As Long
    Dim Y As Long
    Dim x As Long
    Dim ByFlags As Byte
    Dim npcfile As String
    Dim TempInt As Integer
      
    FreeFileMap = FreeFile
    
    Open MAPFl & ".map" For Binary As #FreeFileMap
    Seek FreeFileMap, 1
    
    FreeFileInf = FreeFile
    
    'inf
    Open MAPFl & ".inf" For Binary As #FreeFileInf
    Seek FreeFileInf, 1

    'map Header
    Get #FreeFileMap, , MapInfo(Map).MapVersion
    Get #FreeFileMap, , MiCabecera
    Get #FreeFileMap, , TempInt
    Get #FreeFileMap, , TempInt
    Get #FreeFileMap, , TempInt
    Get #FreeFileMap, , TempInt
    
    'inf Header
    Get #FreeFileInf, , TempInt
    Get #FreeFileInf, , TempInt
    Get #FreeFileInf, , TempInt
    Get #FreeFileInf, , TempInt
    Get #FreeFileInf, , TempInt

    For Y = YMinMapSize To YMaxMapSize
        For x = XMinMapSize To XMaxMapSize
            
            '.dat file
            Get FreeFileMap, , ByFlags

            If ByFlags And 1 Then
1                MapData(Map, x, Y).Blocked = 1
            End If
            
2            Get FreeFileMap, , MapData(Map, x, Y).Graphic(1)
            
            'Layer 2 used?
            If ByFlags And 2 Then Get FreeFileMap, , MapData(Map, x, Y).Graphic(2)
            
            'Layer 3 used?
            If ByFlags And 4 Then Get FreeFileMap, , MapData(Map, x, Y).Graphic(3)
            
            'Layer 4 used?
            If ByFlags And 8 Then Get FreeFileMap, , MapData(Map, x, Y).Graphic(4)
            
            'Trigger used?
            If ByFlags And 16 Then
                'Enums are 4 byte long in VB, so we make sure we only read 2
                Get FreeFileMap, , TempInt
3                MapData(Map, x, Y).trigger = TempInt
            End If
            
            Get FreeFileInf, , ByFlags
            
            If ByFlags And 1 Then
31                Get FreeFileInf, , MapData(Map, x, Y).TileExit.Map
32                Get FreeFileInf, , MapData(Map, x, Y).TileExit.x
33                Get FreeFileInf, , MapData(Map, x, Y).TileExit.Y
            End If
            
            If ByFlags And 2 Then
                'Get and make NPC
34                Get FreeFileInf, , MapData(Map, x, Y).NpcIndex
                
                If MapData(Map, x, Y).NpcIndex > 0 Then
                    If MapData(Map, x, Y).NpcIndex > 499 Then
                        npcfile = DatPath & "NPCs-HOSTILES.dat"
                    Else
                        npcfile = DatPath & "NPCs.dat"
                    End If

                    'Si el npc debe hacer respawn en la pos
                    'original la guardamos
35                    If val(GetVar(npcfile, "NPC" & MapData(Map, x, Y).NpcIndex, "PosOrig")) = 1 Then
36                        MapData(Map, x, Y).NpcIndex = OpenNPC(MapData(Map, x, Y).NpcIndex)
37                        Npclist(MapData(Map, x, Y).NpcIndex).Orig.Map = Map
38                        Npclist(MapData(Map, x, Y).NpcIndex).Orig.x = x
39                        Npclist(MapData(Map, x, Y).NpcIndex).Orig.Y = Y
                    Else
301                        MapData(Map, x, Y).NpcIndex = OpenNPC(MapData(Map, x, Y).NpcIndex)
                    End If
                            
302                    Npclist(MapData(Map, x, Y).NpcIndex).pos.Map = Map
303                    Npclist(MapData(Map, x, Y).NpcIndex).pos.x = x
304                    Npclist(MapData(Map, x, Y).NpcIndex).pos.Y = Y
                            
305                    Call MakeNPCChar(SendTarget.ToMap, 0, 0, MapData(Map, x, Y).NpcIndex, 1, 1, 1)
                End If
            End If
            
            If ByFlags And 4 Then
                'Get and make Object
                Get FreeFileInf, , MapData(Map, x, Y).OBJInfo.ObjIndex
                Get FreeFileInf, , MapData(Map, x, Y).OBJInfo.Amount
            End If
        Next x
    Next Y
    
    
    Close FreeFileMap
    Close FreeFileInf
    
4    MapInfo(Map).name = GetVar(MAPFl & ".dat", "Mapa" & Map, "Name")
    MapInfo(Map).Music = GetVar(MAPFl & ".dat", "Mapa" & Map, "MusicNum")
    MapInfo(Map).StartPos.Map = val(ReadField(1, GetVar(MAPFl & ".dat", "Mapa" & Map, "StartPos"), Asc("-")))
    MapInfo(Map).StartPos.x = val(ReadField(2, GetVar(MAPFl & ".dat", "Mapa" & Map, "StartPos"), Asc("-")))
    MapInfo(Map).StartPos.Y = val(ReadField(3, GetVar(MAPFl & ".dat", "Mapa" & Map, "StartPos"), Asc("-")))
    MapInfo(Map).MagiaSinEfecto = val(GetVar(MAPFl & ".dat", "Mapa" & Map, "MagiaSinEfecto"))
    MapInfo(Map).NoEncriptarMP = val(GetVar(MAPFl & ".dat", "Mapa" & Map, "NoEncriptarMP"))
    
    If val(GetVar(MAPFl & ".dat", "Mapa" & Map, "Pk")) = 0 Then
        MapInfo(Map).Pk = True
    Else
        MapInfo(Map).Pk = False
    End If
    
    
    MapInfo(Map).Terreno = GetVar(MAPFl & ".dat", "Mapa" & Map, "Terreno")
    MapInfo(Map).Zona = GetVar(MAPFl & ".dat", "Mapa" & Map, "Zona")
    MapInfo(Map).Restringir = GetVar(MAPFl & ".dat", "Mapa" & Map, "Restringir")
    MapInfo(Map).BackUp = val(GetVar(MAPFl & ".dat", "Mapa" & Map, "BACKUP"))
Exit Sub

errh:
    Call LogError("Error cargando mapa: " & Map & "." & Err.Description & " Linea: " & Erl())
End Sub

Sub LoadSini()

Dim Temporal As Long
Dim Temporal1 As Long
Dim LoopC As Integer

If frmMain.Visible Then frmMain.txStatus.caption = "Cargando info de inicio del server."

BootDelBackUp = val(GetVar(IniPath & "Server.ini", "INIT", "IniciarDesdeBackUp"))

'Misc
CrcSubKey = val(GetVar(IniPath & "Server.ini", "INIT", "CrcSubKey"))

ServerIp = GetVar(IniPath & "Server.ini", "INIT", "ServerIp")
Temporal = InStr(1, ServerIp, ".")
Temporal1 = (mid(ServerIp, 1, Temporal - 1) And &H7F) * 16777216
ServerIp = mid(ServerIp, Temporal + 1, Len(ServerIp))
Temporal = InStr(1, ServerIp, ".")
Temporal1 = Temporal1 + mid(ServerIp, 1, Temporal - 1) * 65536
ServerIp = mid(ServerIp, Temporal + 1, Len(ServerIp))
Temporal = InStr(1, ServerIp, ".")
Temporal1 = Temporal1 + mid(ServerIp, 1, Temporal - 1) * 256
ServerIp = mid(ServerIp, Temporal + 1, Len(ServerIp))

MixedKey = (Temporal1 + ServerIp) Xor &H65F64B42

Puerto = val(GetVar(IniPath & "Server.ini", "INIT", "StartPort"))
HideMe = val(GetVar(IniPath & "Server.ini", "INIT", "Hide"))
AllowMultiLogins = val(GetVar(IniPath & "Server.ini", "INIT", "AllowMultiLogins"))
IdleLimit = val(GetVar(IniPath & "Server.ini", "INIT", "IdleLimit"))
'Lee la version correcta del cliente
ULTIMAVERSION = GetVar(IniPath & "Server.ini", "INIT", "Version")

PuedeCrearPersonajes = val(GetVar(IniPath & "Server.ini", "INIT", "PuedeCrearPersonajes"))
CamaraLenta = val(GetVar(IniPath & "Server.ini", "INIT", "CamaraLenta"))
ServerSoloGMs = val(GetVar(IniPath & "Server.ini", "init", "ServerSoloGMs"))

ArmaduraImperial1 = val(GetVar(IniPath & "Server.ini", "INIT", "ArmaduraImperial1"))
ArmaduraImperial2 = val(GetVar(IniPath & "Server.ini", "INIT", "ArmaduraImperial2"))
ArmaduraImperial3 = val(GetVar(IniPath & "Server.ini", "INIT", "ArmaduraImperial3"))
TunicaMagoImperial = val(GetVar(IniPath & "Server.ini", "INIT", "TunicaMagoImperial"))
TunicaMagoImperialEnanos = val(GetVar(IniPath & "Server.ini", "INIT", "TunicaMagoImperialEnanos"))
ArmaduraCaos1 = val(GetVar(IniPath & "Server.ini", "INIT", "ArmaduraCaos1"))
ArmaduraCaos2 = val(GetVar(IniPath & "Server.ini", "INIT", "ArmaduraCaos2"))
ArmaduraCaos3 = val(GetVar(IniPath & "Server.ini", "INIT", "ArmaduraCaos3"))
TunicaMagoCaos = val(GetVar(IniPath & "Server.ini", "INIT", "TunicaMagoCaos"))
TunicaMagoCaosEnanos = val(GetVar(IniPath & "Server.ini", "INIT", "TunicaMagoCaosEnanos"))
Multexp = val(GetVar(IniPath & "Server.ini", "OTROS", "Experiencia"))
VestimentaImperialHumano = val(GetVar(IniPath & "Server.ini", "INIT", "VestimentaImperialHumano"))
VestimentaImperialEnano = val(GetVar(IniPath & "Server.ini", "INIT", "VestimentaImperialEnano"))
TunicaConspicuaHumano = val(GetVar(IniPath & "Server.ini", "INIT", "TunicaConspicuaHumano"))
TunicaConspicuaEnano = val(GetVar(IniPath & "Server.ini", "INIT", "TunicaConspicuaEnano"))
ArmaduraNobilisimaHumano = val(GetVar(IniPath & "Server.ini", "INIT", "ArmaduraNobilisimaHumano"))
ArmaduraNobilisimaEnano = val(GetVar(IniPath & "Server.ini", "INIT", "ArmaduraNobilisimaEnano"))
ArmaduraGranSacerdote = val(GetVar(IniPath & "Server.ini", "INIT", "ArmaduraGranSacerdote"))

VestimentaLegionHumano = val(GetVar(IniPath & "Server.ini", "INIT", "VestimentaLegionHumano"))
VestimentaLegionEnano = val(GetVar(IniPath & "Server.ini", "INIT", "VestimentaLegionEnano"))
TunicaLobregaHumano = val(GetVar(IniPath & "Server.ini", "INIT", "TunicaLobregaHumano"))
TunicaLobregaEnano = val(GetVar(IniPath & "Server.ini", "INIT", "TunicaLobregaEnano"))
TunicaEgregiaHumano = val(GetVar(IniPath & "Server.ini", "INIT", "TunicaEgregiaHumano"))
TunicaEgregiaEnano = val(GetVar(IniPath & "Server.ini", "INIT", "TunicaEgregiaEnano"))
SacerdoteDemoniaco = val(GetVar(IniPath & "Server.ini", "INIT", "SacerdoteDemoniaco"))



ClientsCommandsQueue = val(GetVar(IniPath & "Server.ini", "INIT", "ClientsCommandsQueue"))
EnTesting = val(GetVar(IniPath & "Server.ini", "INIT", "Testing"))
EncriptarProtocolosCriticos = val(GetVar(IniPath & "Server.ini", "INIT", "Encriptar"))

'Start pos
StartPos.Map = val(ReadField(1, GetVar(IniPath & "Server.ini", "INIT", "StartPos"), 45))
StartPos.x = val(ReadField(2, GetVar(IniPath & "Server.ini", "INIT", "StartPos"), 45))
StartPos.Y = val(ReadField(3, GetVar(IniPath & "Server.ini", "INIT", "StartPos"), 45))

'Intervalos
SanaIntervaloSinDescansar = val(GetVar(IniPath & "Server.ini", "INTERVALOS", "SanaIntervaloSinDescansar"))
FrmInterv.txtSanaIntervaloSinDescansar.Text = SanaIntervaloSinDescansar

StaminaIntervaloSinDescansar = val(GetVar(IniPath & "Server.ini", "INTERVALOS", "StaminaIntervaloSinDescansar"))
FrmInterv.txtStaminaIntervaloSinDescansar.Text = StaminaIntervaloSinDescansar

SanaIntervaloDescansar = val(GetVar(IniPath & "Server.ini", "INTERVALOS", "SanaIntervaloDescansar"))
FrmInterv.txtSanaIntervaloDescansar.Text = SanaIntervaloDescansar

StaminaIntervaloDescansar = val(GetVar(IniPath & "Server.ini", "INTERVALOS", "StaminaIntervaloDescansar"))
FrmInterv.txtStaminaIntervaloDescansar.Text = StaminaIntervaloDescansar

IntervaloSed = val(GetVar(IniPath & "Server.ini", "INTERVALOS", "IntervaloSed"))
FrmInterv.txtIntervaloSed.Text = IntervaloSed

IntervaloHambre = val(GetVar(IniPath & "Server.ini", "INTERVALOS", "IntervaloHambre"))
FrmInterv.txtIntervaloHambre.Text = IntervaloHambre

IntervaloVeneno = val(GetVar(IniPath & "Server.ini", "INTERVALOS", "IntervaloVeneno"))
FrmInterv.txtIntervaloVeneno.Text = IntervaloVeneno

IntervaloParalizado = val(GetVar(IniPath & "Server.ini", "INTERVALOS", "IntervaloParalizado"))
FrmInterv.txtIntervaloParalizado.Text = IntervaloParalizado

IntervaloInvisible = val(GetVar(IniPath & "Server.ini", "INTERVALOS", "IntervaloInvisible"))
FrmInterv.txtIntervaloInvisible.Text = IntervaloInvisible

IntervaloFrio = val(GetVar(IniPath & "Server.ini", "INTERVALOS", "IntervaloFrio"))
FrmInterv.txtIntervaloFrio.Text = IntervaloFrio

IntervaloWavFx = val(GetVar(IniPath & "Server.ini", "INTERVALOS", "IntervaloWAVFX"))
FrmInterv.txtIntervaloWAVFX.Text = IntervaloWavFx

IntervaloInvocacion = val(GetVar(IniPath & "Server.ini", "INTERVALOS", "IntervaloInvocacion"))
FrmInterv.txtInvocacion.Text = IntervaloInvocacion

IntervaloParaConexion = val(GetVar(IniPath & "Server.ini", "INTERVALOS", "IntervaloParaConexion"))
FrmInterv.txtIntervaloParaConexion.Text = IntervaloParaConexion

'&&&&&&&&&&&&&&&&&&&&& TIMERS &&&&&&&&&&&&&&&&&&&&&&&


IntervaloUserPuedeCastear = val(GetVar(IniPath & "Server.ini", "INTERVALOS", "IntervaloLanzaHechizo"))
FrmInterv.txtIntervaloLanzaHechizo.Text = IntervaloUserPuedeCastear

frmMain.TIMER_AI.Interval = val(GetVar(IniPath & "Server.ini", "INTERVALOS", "IntervaloNpcAI"))
FrmInterv.txtAI.Text = frmMain.TIMER_AI.Interval

frmMain.npcataca.Interval = val(GetVar(IniPath & "Server.ini", "INTERVALOS", "IntervaloNpcPuedeAtacar"))
FrmInterv.txtNPCPuedeAtacar.Text = frmMain.npcataca.Interval

IntervaloUserPuedeTrabajar = val(GetVar(IniPath & "Server.ini", "INTERVALOS", "IntervaloTrabajo"))
FrmInterv.txtTrabajo.Text = IntervaloUserPuedeTrabajar

IntervaloUserPuedeAtacar = val(GetVar(IniPath & "Server.ini", "INTERVALOS", "IntervaloUserPuedeAtacar"))
FrmInterv.txtPuedeAtacar.Text = IntervaloUserPuedeAtacar

frmMain.CmdExec.Interval = val(GetVar(IniPath & "Server.ini", "INTERVALOS", "IntervaloTimerExec"))
FrmInterv.txtCmdExec.Text = frmMain.CmdExec.Interval

MinutosWs = val(GetVar(IniPath & "Server.ini", "INTERVALOS", "IntervaloWS"))

IntervaloCerrarConexion = val(GetVar(IniPath & "Server.ini", "INTERVALOS", "IntervaloCerrarConexion"))
IntervaloUserPuedeUsar = val(GetVar(IniPath & "Server.ini", "INTERVALOS", "IntervaloUserPuedeUsar"))
IntervaloFlechasCazadores = val(GetVar(IniPath & "Server.ini", "INTERVALOS", "IntervaloFlechasCazadores"))

IntervaloAutoReiniciar = val(GetVar(IniPath & "Server.ini", "INTERVALOS", "IntervaloAutoReiniciar"))


'Ressurect pos
ResPos.Map = val(ReadField(1, GetVar(IniPath & "Server.ini", "INIT", "ResPos"), 45))
ResPos.x = val(ReadField(2, GetVar(IniPath & "Server.ini", "INIT", "ResPos"), 45))
ResPos.Y = val(ReadField(3, GetVar(IniPath & "Server.ini", "INIT", "ResPos"), 45))
  
recordusuarios = val(GetVar(IniPath & "Server.ini", "INIT", "Record"))
  
'Max users
Temporal = val(GetVar(IniPath & "Server.ini", "INIT", "MaxUsers"))
If MaxUsers = 0 Then
    MaxUsers = Temporal
    ReDim UserList(1 To MaxUsers) As User
End If

Nix.Map = GetVar(DatPath & "Ciudades.dat", "NIX", "Mapa")
Nix.x = GetVar(DatPath & "Ciudades.dat", "NIX", "X")
Nix.Y = GetVar(DatPath & "Ciudades.dat", "NIX", "Y")

Ullathorpe.Map = GetVar(DatPath & "Ciudades.dat", "Ullathorpe", "Mapa")
Ullathorpe.x = GetVar(DatPath & "Ciudades.dat", "Ullathorpe", "X")
Ullathorpe.Y = GetVar(DatPath & "Ciudades.dat", "Ullathorpe", "Y")

Banderbill.Map = GetVar(DatPath & "Ciudades.dat", "Banderbill", "Mapa")
Banderbill.x = GetVar(DatPath & "Ciudades.dat", "Banderbill", "X")
Banderbill.Y = GetVar(DatPath & "Ciudades.dat", "Banderbill", "Y")

Lindos.Map = GetVar(DatPath & "Ciudades.dat", "Lindos", "Mapa")
Lindos.x = GetVar(DatPath & "Ciudades.dat", "Lindos", "X")
Lindos.Y = GetVar(DatPath & "Ciudades.dat", "Lindos", "Y")


Call MD5sCarga


'Call LoadAntiCheat
#If SeguridadAlkon Then
Encriptacion.StringValidacion = Encriptacion.ArmarStringValidacion
#End If

End Sub

Sub WriteVar(ByVal file As String, ByVal Main As String, ByVal Var As String, ByVal value As String)
'*****************************************************************
'Escribe VAR en un archivo
'*****************************************************************

writeprivateprofilestring Main, Var, value, file
    
End Sub

Sub SaveUser(ByVal userindex As Integer, ByVal UserFile As String)
On Error GoTo errhandler

Dim OldUserHead As Long


'ESTO TIENE QUE EVITAR ESE BUGAZO QUE NO SE POR QUE GRABA USUARIOS NULOS
If UserList(userindex).Clase = "" Or UserList(userindex).Stats.ELV = 0 Then
    Call LogCriticEvent("Estoy intentantdo guardar un usuario nulo de nombre: " & UserList(userindex).name)
    Exit Sub
End If


If UserList(userindex).flags.Mimetizado = 1 Then
    UserList(userindex).char.Body = UserList(userindex).CharMimetizado.Body
    UserList(userindex).char.Head = UserList(userindex).CharMimetizado.Head
    UserList(userindex).char.CascoAnim = UserList(userindex).CharMimetizado.CascoAnim
    UserList(userindex).char.ShieldAnim = UserList(userindex).CharMimetizado.ShieldAnim
    UserList(userindex).char.WeaponAnim = UserList(userindex).CharMimetizado.WeaponAnim

    UserList(userindex).Counters.Mimetismo = 0
    UserList(userindex).flags.Mimetizado = 0
End If



If FileExist(UserFile, vbNormal) Then
       If UserList(userindex).flags.Muerto = 1 Then
        OldUserHead = UserList(userindex).char.Head
        UserList(userindex).char.Head = CStr(GetVar(UserFile, "INIT", "Head"))
       End If
'       Kill UserFile
End If

Dim LoopC As Integer


Call WriteVar(UserFile, "FLAGS", "Muerto", CStr(UserList(userindex).flags.Muerto))
Call WriteVar(UserFile, "FLAGS", "Escondido", CStr(UserList(userindex).flags.Escondido))
Call WriteVar(UserFile, "FLAGS", "Hambre", CStr(UserList(userindex).flags.Hambre))
Call WriteVar(UserFile, "FLAGS", "Sed", CStr(UserList(userindex).flags.Sed))
Call WriteVar(UserFile, "FLAGS", "Desnudo", CStr(UserList(userindex).flags.Desnudo))
Call WriteVar(UserFile, "FLAGS", "Ban", CStr(UserList(userindex).flags.Ban))
Call WriteVar(UserFile, "FLAGS", "Silenciado", CStr(UserList(userindex).flags.Silenciado))
Call WriteVar(UserFile, "FLAGS", "Navegando", CStr(UserList(userindex).flags.Navegando))

Call WriteVar(UserFile, "FLAGS", "Envenenado", CStr(UserList(userindex).flags.Envenenado))
Call WriteVar(UserFile, "FLAGS", "Paralizado", CStr(UserList(userindex).flags.Paralizado))

Call WriteVar(UserFile, "CONSEJO", "PERTENECE", CStr(UserList(userindex).flags.PertAlCons))
Call WriteVar(UserFile, "CONSEJO", "PERTENECECAOS", CStr(UserList(userindex).flags.PertAlConsCaos))


Call WriteVar(UserFile, "COUNTERS", "Pena", CStr(UserList(userindex).Counters.Pena))

Call WriteVar(UserFile, "FACCIONES", "EjercitoReal", CStr(UserList(userindex).Faccion.ArmadaReal))
Call WriteVar(UserFile, "FACCIONES", "EjercitoCaos", CStr(UserList(userindex).Faccion.FuerzasCaos))
Call WriteVar(UserFile, "FACCIONES", "CiudMatados", CStr(UserList(userindex).Faccion.CiudadanosMatados))
Call WriteVar(UserFile, "FACCIONES", "CrimMatados", CStr(UserList(userindex).Faccion.CriminalesMatados))
Call WriteVar(UserFile, "FACCIONES", "rArCaos", CStr(UserList(userindex).Faccion.RecibioArmaduraCaos))
Call WriteVar(UserFile, "FACCIONES", "rArReal", CStr(UserList(userindex).Faccion.RecibioArmaduraReal))
Call WriteVar(UserFile, "FACCIONES", "rExCaos", CStr(UserList(userindex).Faccion.RecibioExpInicialCaos))
Call WriteVar(UserFile, "FACCIONES", "rExReal", CStr(UserList(userindex).Faccion.RecibioExpInicialReal))
Call WriteVar(UserFile, "FACCIONES", "recCaos", CStr(UserList(userindex).Faccion.RecompensasCaos))
Call WriteVar(UserFile, "FACCIONES", "recReal", CStr(UserList(userindex).Faccion.RecompensasReal))
Call WriteVar(UserFile, "FACCIONES", "Reenlistadas", CStr(UserList(userindex).Faccion.Reenlistadas))

'?Fueron modificados los atributos del usuario?
If Not UserList(userindex).flags.TomoPocion Then
    For LoopC = 1 To UBound(UserList(userindex).Stats.UserAtributos)
        Call WriteVar(UserFile, "ATRIBUTOS", "AT" & LoopC, CStr(UserList(userindex).Stats.UserAtributos(LoopC)))
    Next
Else
    For LoopC = 1 To UBound(UserList(userindex).Stats.UserAtributos)
        'UserList(UserIndex).Stats.UserAtributos(LoopC) = UserList(UserIndex).Stats.UserAtributosBackUP(LoopC)
        Call WriteVar(UserFile, "ATRIBUTOS", "AT" & LoopC, CStr(UserList(userindex).Stats.UserAtributosBackUP(LoopC)))
    Next
End If

For LoopC = 1 To UBound(UserList(userindex).Stats.UserSkills)
    Call WriteVar(UserFile, "SKILLS", "SK" & LoopC, CStr(UserList(userindex).Stats.UserSkills(LoopC)))
Next


Call WriteVar(UserFile, "CONTACTO", "Email", UserList(userindex).email)

Call WriteVar(UserFile, "INIT", "Genero", UserList(userindex).Genero)
Call WriteVar(UserFile, "INIT", "Raza", UserList(userindex).Raza)
Call WriteVar(UserFile, "INIT", "Hogar", UserList(userindex).Hogar)
Call WriteVar(UserFile, "INIT", "Clase", UserList(userindex).Clase)
Call WriteVar(UserFile, "INIT", "Password", UserList(userindex).Password)
Call WriteVar(UserFile, "INIT", "Desc", UserList(userindex).Desc)
Call WriteVar(UserFile, "INIT", "Titulo", UserList(userindex).Titulo)

Call WriteVar(UserFile, "INIT", "Heading", CStr(UserList(userindex).char.Heading))

Call WriteVar(UserFile, "INIT", "Head", CStr(UserList(userindex).OrigChar.Head))

If UserList(userindex).flags.Muerto = 0 Then
    Call WriteVar(UserFile, "INIT", "Body", CStr(UserList(userindex).char.Body))
End If

Call WriteVar(UserFile, "INIT", "Alas", CStr(UserList(userindex).char.Alas))
Call WriteVar(UserFile, "INIT", "Arma", CStr(UserList(userindex).char.WeaponAnim))
Call WriteVar(UserFile, "INIT", "Escudo", CStr(UserList(userindex).char.ShieldAnim))
Call WriteVar(UserFile, "INIT", "Casco", CStr(UserList(userindex).char.CascoAnim))


Call WriteVar(UserFile, "INIT", "LastIP", UserList(userindex).ip)
Call WriteVar(UserFile, "INIT", "Position", UserList(userindex).pos.Map & "-" & UserList(userindex).pos.x & "-" & UserList(userindex).pos.Y)
'soporte
Call WriteVar(UserFile, "INIT", "Pregunta", UserList(userindex).Pregunta)
Call WriteVar(UserFile, "INIT", "Respuesta", UserList(userindex).Respuesta)

Call WriteVar(UserFile, "STATS", "GLD", CStr(UserList(userindex).Stats.GLD))
Call WriteVar(UserFile, "STATS", "BANCO", CStr(UserList(userindex).Stats.Banco))

Call WriteVar(UserFile, "STATS", "MET", CStr(UserList(userindex).Stats.MET))
Call WriteVar(UserFile, "STATS", "MaxHP", CStr(UserList(userindex).Stats.MaxHP))
Call WriteVar(UserFile, "STATS", "MinHP", CStr(UserList(userindex).Stats.MinHP))

Call WriteVar(UserFile, "STATS", "MaxSTA", CStr(UserList(userindex).Stats.MaxSta))
Call WriteVar(UserFile, "STATS", "MinSTA", CStr(UserList(userindex).Stats.MinSta))

Call WriteVar(UserFile, "STATS", "MaxMAN", CStr(UserList(userindex).Stats.MaxMAN))
Call WriteVar(UserFile, "STATS", "MinMAN", CStr(UserList(userindex).Stats.MinMAN))

Call WriteVar(UserFile, "STATS", "TrofOro", CStr(UserList(userindex).Stats.TrofOro))
Call WriteVar(UserFile, "STATS", "TrofPlata", CStr(UserList(userindex).Stats.TrofPlata))
Call WriteVar(UserFile, "STATS", "TrofBronce", CStr(UserList(userindex).Stats.TrofBronce))
Call WriteVar(UserFile, "STATS", "TrofMadera", CStr(UserList(userindex).Stats.TrofMadera))

'puntos
Call WriteVar(UserFile, "STATS", "PuntosDeath", CStr(UserList(userindex).Stats.PuntosDeath))
Call WriteVar(UserFile, "STATS", "PuntosDuelos", CStr(UserList(userindex).Stats.PuntosDuelos))
Call WriteVar(UserFile, "STATS", "PuntosTorneo", CStr(UserList(userindex).Stats.PuntosTorneo))
Call WriteVar(UserFile, "STATS", "PuntosRetos", CStr(UserList(userindex).Stats.PuntosRetos))
Call WriteVar(UserFile, "STATS", "PuntosPlante", CStr(UserList(userindex).Stats.PuntosPlante))
Call WriteVar(UserFile, "STATS", "PuntosCanje", CStr(UserList(userindex).Stats.PuntosCanje))

Call WriteVar(UserFile, "STATS", "MaxHIT", CStr(UserList(userindex).Stats.MaxHIT))
Call WriteVar(UserFile, "STATS", "MinHIT", CStr(UserList(userindex).Stats.MinHIT))
Call WriteVar(UserFile, "STATS", "MaxAGU", CStr(UserList(userindex).Stats.MaxAGU))
Call WriteVar(UserFile, "STATS", "MinAGU", CStr(UserList(userindex).Stats.MinAGU))

Call WriteVar(UserFile, "STATS", "MaxHAM", CStr(UserList(userindex).Stats.MaxHam))
Call WriteVar(UserFile, "STATS", "MinHAM", CStr(UserList(userindex).Stats.MinHam))

Call WriteVar(UserFile, "STATS", "SkillPtsLibres", CStr(UserList(userindex).Stats.SkillPts))
  
Call WriteVar(UserFile, "STATS", "EXP", CStr(UserList(userindex).Stats.Exp))
Call WriteVar(UserFile, "STATS", "ELV", CStr(UserList(userindex).Stats.ELV))





Call WriteVar(UserFile, "STATS", "ELU", CStr(UserList(userindex).Stats.ELU))
Call WriteVar(UserFile, "MUERTES", "UserMuertes", CStr(UserList(userindex).Stats.UsuariosMatados))
Call WriteVar(UserFile, "MUERTES", "CrimMuertes", CStr(UserList(userindex).Stats.CriminalesMatados))
Call WriteVar(UserFile, "MUERTES", "NpcsMuertes", CStr(UserList(userindex).Stats.NPCsMuertos))
  
'[KEVIN]----------------------------------------------------------------------------
'*******************************************************************************************
Call WriteVar(UserFile, "BancoInventory", "CantidadItems", val(UserList(userindex).BancoInvent.NroItems))
Dim loopd As Integer
For loopd = 1 To MAX_BANCOINVENTORY_SLOTS
    Call WriteVar(UserFile, "BancoInventory", "Obj" & loopd, UserList(userindex).BancoInvent.Object(loopd).ObjIndex & "-" & UserList(userindex).BancoInvent.Object(loopd).Amount)
Next loopd
'*******************************************************************************************
'[/KEVIN]-----------
  
'Save Inv
Call WriteVar(UserFile, "Inventory", "CantidadItems", val(UserList(userindex).Invent.NroItems))

For LoopC = 1 To MAX_INVENTORY_SLOTS
    Call WriteVar(UserFile, "Inventory", "Obj" & LoopC, UserList(userindex).Invent.Object(LoopC).ObjIndex & "-" & UserList(userindex).Invent.Object(LoopC).Amount & "-" & UserList(userindex).Invent.Object(LoopC).Equipped)
Next

Call WriteVar(UserFile, "Inventory", "WeaponEqpSlot", str(UserList(userindex).Invent.WeaponEqpSlot))
Call WriteVar(UserFile, "Inventory", "AlaEqpSlot", str(UserList(userindex).Invent.AlaEqpSlot))
Call WriteVar(UserFile, "Inventory", "ArmourEqpSlot", str(UserList(userindex).Invent.ArmourEqpSlot))
Call WriteVar(UserFile, "Inventory", "CascoEqpSlot", str(UserList(userindex).Invent.CascoEqpSlot))
Call WriteVar(UserFile, "Inventory", "EscudoEqpSlot", str(UserList(userindex).Invent.EscudoEqpSlot))
Call WriteVar(UserFile, "Inventory", "BarcoSlot", str(UserList(userindex).Invent.BarcoSlot))
Call WriteVar(UserFile, "Inventory", "MunicionSlot", str(UserList(userindex).Invent.MunicionEqpSlot))
Call WriteVar(UserFile, "Inventory", "HerramientaSlot", str(UserList(userindex).Invent.HerramientaEqpSlot))


'Reputacion
Call WriteVar(UserFile, "REP", "Asesino", val(UserList(userindex).Reputacion.AsesinoRep))
Call WriteVar(UserFile, "REP", "Bandido", val(UserList(userindex).Reputacion.BandidoRep))
Call WriteVar(UserFile, "REP", "Burguesia", val(UserList(userindex).Reputacion.BurguesRep))
Call WriteVar(UserFile, "REP", "Ladrones", val(UserList(userindex).Reputacion.LadronesRep))
Call WriteVar(UserFile, "REP", "Nobles", val(UserList(userindex).Reputacion.NobleRep))
Call WriteVar(UserFile, "REP", "Plebe", val(UserList(userindex).Reputacion.PlebeRep))

Dim L As Long
L = (-UserList(userindex).Reputacion.AsesinoRep) + _
    (-UserList(userindex).Reputacion.BandidoRep) + _
    UserList(userindex).Reputacion.BurguesRep + _
    (-UserList(userindex).Reputacion.LadronesRep) + _
    UserList(userindex).Reputacion.NobleRep + _
    UserList(userindex).Reputacion.PlebeRep
L = L / 6
Call WriteVar(UserFile, "REP", "Promedio", val(L))

Dim cad As String

For LoopC = 1 To MAXUSERHECHIZOS
    cad = UserList(userindex).Stats.UserHechizos(LoopC)
    Call WriteVar(UserFile, "HECHIZOS", "H" & LoopC, cad)
Next

Dim NroMascotas As Long
NroMascotas = UserList(userindex).NroMacotas

For LoopC = 1 To MAXMASCOTAS
    ' Mascota valida?
    If UserList(userindex).MascotasIndex(LoopC) > 0 Then
        ' Nos aseguramos que la criatura no fue invocada
        If Npclist(UserList(userindex).MascotasIndex(LoopC)).Contadores.TiempoExistencia = 0 Then
            cad = UserList(userindex).MascotasType(LoopC)
        Else 'Si fue invocada no la guardamos
            cad = "0"
            NroMascotas = NroMascotas - 1
        End If
        Call WriteVar(UserFile, "MASCOTAS", "MAS" & LoopC, cad)
    End If

Next

Call WriteVar(UserFile, "MASCOTAS", "NroMascotas", str(NroMascotas))

'Devuelve el head de muerto
If UserList(userindex).flags.Muerto = 1 Then
    UserList(userindex).char.Head = iCabezaMuerto
End If

Exit Sub

errhandler:
Call LogError("Error en SaveUser")

End Sub

Function Criminal(ByVal userindex As Integer) As Boolean

Dim L As Long
L = (-UserList(userindex).Reputacion.AsesinoRep) + _
    (-UserList(userindex).Reputacion.BandidoRep) + _
    UserList(userindex).Reputacion.BurguesRep + _
    (-UserList(userindex).Reputacion.LadronesRep) + _
    UserList(userindex).Reputacion.NobleRep + _
    UserList(userindex).Reputacion.PlebeRep
L = L / 6
Criminal = (L < 0)

End Function

Sub BackUPnPc(NpcIndex As Integer)

Dim NpcNumero As Integer
Dim npcfile As String
Dim LoopC As Integer


NpcNumero = Npclist(NpcIndex).Numero

If NpcNumero > 499 Then
    npcfile = DatPath & "bkNPCs-HOSTILES.dat"
Else
    npcfile = DatPath & "bkNPCs.dat"
End If

'General
Call WriteVar(npcfile, "NPC" & NpcNumero, "Name", Npclist(NpcIndex).name)
Call WriteVar(npcfile, "NPC" & NpcNumero, "Desc", Npclist(NpcIndex).Desc)
Call WriteVar(npcfile, "NPC" & NpcNumero, "Head", val(Npclist(NpcIndex).char.Head))
Call WriteVar(npcfile, "NPC" & NpcNumero, "Body", val(Npclist(NpcIndex).char.Body))
Call WriteVar(npcfile, "NPC" & NpcNumero, "Heading", val(Npclist(NpcIndex).char.Heading))
Call WriteVar(npcfile, "NPC" & NpcNumero, "Movement", val(Npclist(NpcIndex).Movement))
Call WriteVar(npcfile, "NPC" & NpcNumero, "Attackable", val(Npclist(NpcIndex).Attackable))
Call WriteVar(npcfile, "NPC" & NpcNumero, "Comercia", val(Npclist(NpcIndex).Comercia))
Call WriteVar(npcfile, "NPC" & NpcNumero, "TipoItems", val(Npclist(NpcIndex).TipoItems))
Call WriteVar(npcfile, "NPC" & NpcNumero, "Hostil", val(Npclist(NpcIndex).Hostile))
Call WriteVar(npcfile, "NPC" & NpcNumero, "GiveEXP", val(Npclist(NpcIndex).GiveEXP))
Call WriteVar(npcfile, "NPC" & NpcNumero, "GiveGLD", val(Npclist(NpcIndex).GiveGLD))
Call WriteVar(npcfile, "NPC" & NpcNumero, "Hostil", val(Npclist(NpcIndex).Hostile))
Call WriteVar(npcfile, "NPC" & NpcNumero, "Inflacion", val(Npclist(NpcIndex).Inflacion))
Call WriteVar(npcfile, "NPC" & NpcNumero, "InvReSpawn", val(Npclist(NpcIndex).InvReSpawn))
Call WriteVar(npcfile, "NPC" & NpcNumero, "NpcType", val(Npclist(NpcIndex).NPCtype))


'Stats
Call WriteVar(npcfile, "NPC" & NpcNumero, "Alineacion", val(Npclist(NpcIndex).Stats.Alineacion))
Call WriteVar(npcfile, "NPC" & NpcNumero, "DEF", val(Npclist(NpcIndex).Stats.def))
Call WriteVar(npcfile, "NPC" & NpcNumero, "MaxHit", val(Npclist(NpcIndex).Stats.MaxHIT))
Call WriteVar(npcfile, "NPC" & NpcNumero, "MaxHp", val(Npclist(NpcIndex).Stats.MaxHP))
Call WriteVar(npcfile, "NPC" & NpcNumero, "MinHit", val(Npclist(NpcIndex).Stats.MinHIT))
Call WriteVar(npcfile, "NPC" & NpcNumero, "MinHp", val(Npclist(NpcIndex).Stats.MinHP))
Call WriteVar(npcfile, "NPC" & NpcNumero, "DEF", val(Npclist(NpcIndex).Stats.UsuariosMatados))




'Flags
Call WriteVar(npcfile, "NPC" & NpcNumero, "ReSpawn", val(Npclist(NpcIndex).flags.Respawn))
Call WriteVar(npcfile, "NPC" & NpcNumero, "BackUp", val(Npclist(NpcIndex).flags.BackUp))
Call WriteVar(npcfile, "NPC" & NpcNumero, "Domable", val(Npclist(NpcIndex).flags.Domable))

'Inventario
Call WriteVar(npcfile, "NPC" & NpcNumero, "NroItems", val(Npclist(NpcIndex).Invent.NroItems))
If Npclist(NpcIndex).Invent.NroItems > 0 Then
   '[MaTeO 5]
   For LoopC = 1 To MAX_INVENTORY_SLOTS_NPC
   '[/MaTeO 5]
        Call WriteVar(npcfile, "NPC" & NpcNumero, "Obj" & LoopC, Npclist(NpcIndex).Invent.Object(LoopC).ObjIndex & "-" & Npclist(NpcIndex).Invent.Object(LoopC).Amount)
   Next
End If


End Sub



Sub CargarNpcBackUp(NpcIndex As Integer, ByVal NpcNumber As Integer)

'Status
If frmMain.Visible Then frmMain.txStatus.caption = "Cargando backup Npc"

Dim npcfile As String

If NpcNumber > 499 Then
    npcfile = DatPath & "bkNPCs-HOSTILES.dat"
Else
    npcfile = DatPath & "bkNPCs.dat"
End If

Npclist(NpcIndex).Numero = NpcNumber
Npclist(NpcIndex).name = GetVar(npcfile, "NPC" & NpcNumber, "Name")
Npclist(NpcIndex).Desc = GetVar(npcfile, "NPC" & NpcNumber, "Desc")
Npclist(NpcIndex).Movement = val(GetVar(npcfile, "NPC" & NpcNumber, "Movement"))
Npclist(NpcIndex).NPCtype = val(GetVar(npcfile, "NPC" & NpcNumber, "NpcType"))
Npclist(NpcIndex).DefensaMagica = val(GetVar(npcfile, "NPC" & NpcNumber, "DefensaMagica"))

Npclist(NpcIndex).char.Body = val(GetVar(npcfile, "NPC" & NpcNumber, "Body"))
Npclist(NpcIndex).char.Head = val(GetVar(npcfile, "NPC" & NpcNumber, "Head"))
Npclist(NpcIndex).char.Heading = val(GetVar(npcfile, "NPC" & NpcNumber, "Heading"))

Npclist(NpcIndex).Attackable = val(GetVar(npcfile, "NPC" & NpcNumber, "Attackable"))
Npclist(NpcIndex).Comercia = val(GetVar(npcfile, "NPC" & NpcNumber, "Comercia"))
Npclist(NpcIndex).Hostile = val(GetVar(npcfile, "NPC" & NpcNumber, "Hostile"))
Npclist(NpcIndex).GiveEXP = val(GetVar(npcfile, "NPC" & NpcNumber, "GiveEXP"))


Npclist(NpcIndex).GiveGLD = val(GetVar(npcfile, "NPC" & NpcNumber, "GiveGLD"))

Npclist(NpcIndex).InvReSpawn = val(GetVar(npcfile, "NPC" & NpcNumber, "InvReSpawn"))

Npclist(NpcIndex).Stats.MaxHP = val(GetVar(npcfile, "NPC" & NpcNumber, "MaxHP"))
Npclist(NpcIndex).Stats.MinHP = val(GetVar(npcfile, "NPC" & NpcNumber, "MinHP"))
Npclist(NpcIndex).Stats.MaxHIT = val(GetVar(npcfile, "NPC" & NpcNumber, "MaxHIT"))
Npclist(NpcIndex).Stats.MinHIT = val(GetVar(npcfile, "NPC" & NpcNumber, "MinHIT"))
Npclist(NpcIndex).Stats.def = val(GetVar(npcfile, "NPC" & NpcNumber, "DEF"))
Npclist(NpcIndex).Stats.Alineacion = val(GetVar(npcfile, "NPC" & NpcNumber, "Alineacion"))


Dim LoopC As Integer
Dim ln As String
Npclist(NpcIndex).Invent.NroItems = val(GetVar(npcfile, "NPC" & NpcNumber, "NROITEMS"))
If Npclist(NpcIndex).Invent.NroItems > 0 Then
     '[MaTeO 5]
    For LoopC = 1 To MAX_INVENTORY_SLOTS_NPC
    '[/MaTeO 5]
        ln = GetVar(npcfile, "NPC" & NpcNumber, "Obj" & LoopC)
        Npclist(NpcIndex).Invent.Object(LoopC).ObjIndex = val(ReadField(1, ln, 45))
        Npclist(NpcIndex).Invent.Object(LoopC).Amount = val(ReadField(2, ln, 45))
       
    Next LoopC
Else
       '[MaTeO 5]
    For LoopC = 1 To MAX_INVENTORY_SLOTS_NPC
    '[/MaTeO 5]
        Npclist(NpcIndex).Invent.Object(LoopC).ObjIndex = 0
        Npclist(NpcIndex).Invent.Object(LoopC).Amount = 0
    Next LoopC
End If

Npclist(NpcIndex).Inflacion = val(GetVar(npcfile, "NPC" & NpcNumber, "Inflacion"))


Npclist(NpcIndex).flags.NPCActive = True
Npclist(NpcIndex).flags.UseAINow = False
Npclist(NpcIndex).flags.Respawn = val(GetVar(npcfile, "NPC" & NpcNumber, "ReSpawn"))
Npclist(NpcIndex).flags.BackUp = val(GetVar(npcfile, "NPC" & NpcNumber, "BackUp"))
Npclist(NpcIndex).flags.Domable = val(GetVar(npcfile, "NPC" & NpcNumber, "Domable"))
Npclist(NpcIndex).flags.RespawnOrigPos = val(GetVar(npcfile, "NPC" & NpcNumber, "OrigPos"))

'Tipo de items con los que comercia
Npclist(NpcIndex).TipoItems = val(GetVar(npcfile, "NPC" & NpcNumber, "TipoItems"))

End Sub


Sub LogBan(ByVal BannedIndex As Integer, ByVal userindex As Integer, ByVal motivo As String)

Call WriteVar(App.Path & "\logs\" & "BanDetail.log", UserList(BannedIndex).name, "BannedBy", UserList(userindex).name)
Call WriteVar(App.Path & "\logs\" & "BanDetail.log", UserList(BannedIndex).name, "Reason", motivo)

'Log interno del servidor, lo usa para hacer un UNBAN general de toda la gente banned
Dim mifile As Integer
mifile = FreeFile
Open App.Path & "\logs\GenteBanned.log" For Append Shared As #mifile
Print #mifile, UserList(BannedIndex).name
Close #mifile

End Sub


Sub LogBanFromName(ByVal BannedName As String, ByVal userindex As Integer, ByVal motivo As String)

Call WriteVar(App.Path & "\logs\" & "BanDetail.dat", BannedName, "BannedBy", UserList(userindex).name)
Call WriteVar(App.Path & "\logs\" & "BanDetail.dat", BannedName, "Reason", motivo)

'Log interno del servidor, lo usa para hacer un UNBAN general de toda la gente banned
Dim mifile As Integer
mifile = FreeFile
Open App.Path & "\logs\GenteBanned.log" For Append Shared As #mifile
Print #mifile, BannedName
Close #mifile

End Sub


Sub Ban(ByVal BannedName As String, ByVal Baneador As String, ByVal motivo As String)

Call WriteVar(App.Path & "\logs\" & "BanDetail.dat", BannedName, "BannedBy", Baneador)
Call WriteVar(App.Path & "\logs\" & "BanDetail.dat", BannedName, "Reason", motivo)


'Log interno del servidor, lo usa para hacer un UNBAN general de toda la gente banned
Dim mifile As Integer
mifile = FreeFile
Open App.Path & "\logs\GenteBanned.log" For Append Shared As #mifile
Print #mifile, BannedName
Close #mifile

End Sub

Public Sub CargaApuestas()

    Apuestas.Ganancias = val(GetVar(DatPath & "apuestas.dat", "Main", "Ganancias"))
    Apuestas.Perdidas = val(GetVar(DatPath & "apuestas.dat", "Main", "Perdidas"))
    Apuestas.Jugadas = val(GetVar(DatPath & "apuestas.dat", "Main", "Jugadas"))

End Sub
