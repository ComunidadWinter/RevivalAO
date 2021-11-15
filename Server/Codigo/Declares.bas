Attribute VB_Name = "Declaraciones"


Option Explicit
'[MaTeO 13]
Public MazIndex As Integer
Public MazProIndex As Integer
'[/MaTeO 13]
Public Lac_Camina As Long
Public Lac_Pociones As Long
Public Lac_Pegar As Long
Public Lac_Lanzar As Long
Public Lac_Usar As Long
Public Lac_Tirar As Long
Public Type TLac
LCaminar As New Cls_InterGTC
LPociones As New Cls_InterGTC
LPegar As New Cls_InterGTC
LUsar As New Cls_InterGTC
LTirar As New Cls_InterGTC
LLanzar As New Cls_InterGTC
End Type

Public Retos1 As String
Public Retos2 As String
Public Plante1 As String
Public Plante2 As String
Public PrecioQl As Byte
Public ComerciarAc As Boolean
Public KATA As Boolean
Public terminodeat As Boolean
Public bandasqls As Integer
'invocaciones
'Mapa
Public tukiql As Integer
Public Const mapainvo = 86
' posi 1
Public Const mapainvoX1 = 41
Public Const mapainvoY1 = 44
' posi 2
Public Const mapainvoX2 = 47
Public Const mapainvoY2 = 49
'posi 3
Public Const mapainvoX3 = 47
Public Const mapainvoY3 = 39
'posi 4
Public Const mapainvoX4 = 53
Public Const mapainvoY4 = 44






Public YaHayPlante As Boolean
Public denuncias As Boolean
Public keyA As String
Public keyB As String
''
' Modulo de declaraciones. Aca hay de todo.
Public duelosespera As Integer
Public duelosreta As Integer

Public AlmacenaDominador As String
Public AlmacenaDominadornix As String
Public Lemuria As String
Public Tale As String
Public Fortaleza As String

Public HoraNix As String
Public HoraUlla As String
Public HoraTale As String
Public HoraLemuria As String
Public HoraForta As String


Public FPS_GM As Integer
Public AUTORESPAWN_NPC As Integer
Public AUTORESPAWN_TIEMPO As Integer
Public AUTORESPAWN_TRANSC As Integer
Public AUTORESPAWN1_NPC As Integer
Public AUTORESPAWN1_TIEMPO As Integer
Public AUTORESPAWN1_TRANSC As Integer
Public numduelos As Integer

Public AlphaX As Byte
Public Desbanecimiento1 As Boolean
Public Desbanecimiento2 As Boolean
Public UserSolicitadoFPS As String
Public MixedKey As Long
Public ServerIp As String
Public CrcSubKey As String
Public CuentaRegresiva As Long
Type tEstadisticasDiarias
    Segundos As Double
    MaxUsuarios As Integer
    Promedio As Integer
End Type
    
Public DayStats As tEstadisticasDiarias

#If SeguridadAlkon Then

#End If

Public aClon As New clsAntiMassClon
Public TrashCollector As New Collection


Public Const MAXSPAWNATTEMPS = 60
Public Const MAXUSERMATADOS = 9000000
Public Const LoopAdEternum = 999
Public Const FXSANGRE = 14


Public Const iFragataFantasmal = 87

Public Enum iMinerales
    HierroCrudo = 192
    PlataCruda = 193
    OroCrudo = 194
    LingoteDeHierro = 386
    LingoteDePlata = 387
    LingoteDeOro = 388
End Enum


Public Type tLlamadaGM
    Usuario As String * 255
    Desc As String * 255
End Type

Public Enum PlayerType
    User = 0
    Consejero = 1
    SemiDios = 2
    Dios = 3
    Admin = 4
End Enum

Public Const LimiteNewbie As Byte = 12

Public Type tCabecera 'Cabecera de los con
    Desc As String * 255
    crc As Long
    MagicWord As Long
End Type

Public MiCabecera As tCabecera

'Barrin 3/10/03
Public Const TIEMPO_INICIOMEDITAR As Byte = 3

Public Const NingunEscudo As Integer = 2
Public Const NingunCasco As Integer = 2
Public Const NingunArma As Integer = 2

'[MaTeO 9]
Public Const NingunAlas As Integer = 0
'[/MaTeO 9]
Public Const EspadaMataDragonesIndex As Integer = 402
Public Const LAUDMAGICO As Integer = 696

Public Const MAXMASCOTASENTRENADOR As Byte = 7

Public Enum FXIDs
    '[MaTeO 8]
    FXWARP = 66
    '[/MaTeO 8]
    FXMEDITARNW = 4
    FXMEDITARAZULNW = 5
    FXMEDITARFUEGUITO = 6
    FXMEDITARFUEGO = 27
    FXMEDITARMEDIANO = 54
    FXMEDITARAZULCITO = 55
    FXMEDITARGRIS = 53
    FXMEDITARFULL = 52
End Enum

Public Const TIEMPO_CARCEL_PIQUETE As Long = 10

''
' TRIGGERS
'
' @param NADA nada
' @param BAJOTECHO bajo techo
' @param trigger_2 ???
' @param POSINVALIDA los npcs no pueden pisar tiles con este trigger
' @param ZONASEGURA no se puede robar o pelear desde este trigger
' @param ANTIPIQUETE
' @param ZONAPELEA al pelear en este trigger no se caen las cosas y no cambia el estado de ciuda o crimi
'
Public Enum eTrigger
    NADA = 0
    BAJOTECHO = 1
    trigger_2 = 2
    POSINVALIDA = 3
    ZONASEGURA = 4
    ANTIPIQUETE = 5
    ZONAPELEA = 6
    resu = 7
End Enum

''
' constantes para el trigger 6
'
' @see eTrigger
' @param TRIGGER6_PERMITE TRIGGER6_PERMITE
' @param TRIGGER6_PROHIBE TRIGGER6_PROHIBE
' @param TRIGGER6_AUSENTE El trigger no aparece
'
Public Enum eTrigger6
    TRIGGER6_PERMITE = 1
    TRIGGER6_PROHIBE = 2
    TRIGGER6_AUSENTE = 3
End Enum

'TODO : Reemplazar por un enum
Public Const Bosque = "BOSQUE"
Public Const Nieve = "NIEVE"
Public Const Desierto = "DESIERTO"
Public Const Ciudad = "CIUDAD"
Public Const Campo = "CAMPO"
Public Const Dungeon = "DUNGEON"

' <<<<<< Targets >>>>>>
Public Enum TargetType
    uUsuarios = 1
    uNPC = 2
    uUsuariosYnpc = 3
    uTerreno = 4
End Enum

' <<<<<< Acciona sobre >>>>>>
Public Enum TipoHechizo
    uPropiedades = 1
    uEstado = 2
    uMaterializa = 3    'Nose usa
    uInvocacion = 4
End Enum

Public Const DRAGON As Integer = 6

Public Const MAX_MENSAJES_FORO As Byte = 35

Public Const MAXUSERHECHIZOS As Byte = 35


' TODO: Y ESTO ? LO CONOCE GD ?
Public Const EsfuerzoTalarGeneral As Byte = 4
Public Const EsfuerzoTalarLe�ador As Byte = 2

Public Const EsfuerzoPescarPescador As Byte = 1
Public Const EsfuerzoPescarGeneral As Byte = 3

Public Const EsfuerzoExcavarMinero As Byte = 2
Public Const EsfuerzoExcavarGeneral As Byte = 5

Public Const FX_TELEPORT_INDEX As Integer = 1

' La utilidad de esto es casi nula, s�lo se revisa si fue a la cabeza...
Public Enum PartesCuerpo
    bCabeza = 1
    bPiernaIzquierda = 2
    bPiernaDerecha = 3
    bBrazoDerecho = 4
    bBrazoIzquierdo = 5
    bTorso = 6
End Enum

Public Const Guardias As Integer = 6

Public Const MAXREP As Long = 6000000
Public Const MaxOro As Long = 999999999
Public Const MAXEXP As Long = 999999999

Public Const MAXATRIBUTOS As Byte = 35
Public Const MINATRIBUTOS As Byte = 6

Public Const LingoteHierro As Integer = 386
Public Const LingotePlata As Integer = 387
Public Const LingoteOro As Integer = 388
Public Const Le�a As Integer = 58


Public Const MAXNPCS As Integer = 10000
Public Const MAXCHARS As Integer = 10000

Public Const HACHA_LE�ADOR As Integer = 127
Public Const PIQUETE_MINERO As Integer = 187

Public Const DAGA As Integer = 15
Public Const FOGATA_APAG As Integer = 136
Public Const FOGATA As Integer = 63
Public Const ORO_MINA As Integer = 194
Public Const PLATA_MINA As Integer = 193
Public Const HIERRO_MINA As Integer = 192
Public Const MARTILLO_HERRERO As Integer = 389
Public Const SERRUCHO_CARPINTERO As Integer = 198
Public Const ObjArboles As Integer = 4
Public Const RED_PESCA As Integer = 543
Public Const CA�A_PESCA As Integer = 138
Public ContReSpawnNpc As Integer
Public asdff As Integer
Public xao As Integer
Public mariano As Integer

Public Enum eNPCType
    Comun = 0
    Revividor = 1
    GuardiaReal = 2
    Entrenador = 3
    Banquero = 4
    Timbero = 7
    Duelos = 10
    Guardiascaos = 8
    Guardia = 9
End Enum

Public Const MIN_APU�ALAR As Byte = 10

'********** CONSTANTANTES ***********

''
' Cantidad de skills
Public Const NUMSKILLS As Byte = 21

''
' Cantidad de Atributos
Public Const NUMATRIBUTOS As Byte = 5

''
' Cantidad de Clases
Public Const NUMCLASES As Byte = 7

''
' Cantidad de Razas
Public Const NUMRAZAS As Byte = 5


''
' Valor maximo de cada skill
Public Const MAXSKILLPOINTS As Byte = 100

''
' Constante para indicar que se esta usando ORO
Public Const FLAGORO As Integer = 777

''
'Direccion
'
' @param NORTH Norte
' @param EAST Este
' @param SOUTH Sur
' @param WEST Oeste
'
Public Enum eHeading
    NORTH = 1
    EAST = 2
    SOUTH = 3
    WEST = 4
End Enum

''
' Cantidad maxima de mascotas
Public Const MAXMASCOTAS As Byte = 3

'%%%%%%%%%% CONSTANTES DE INDICES %%%%%%%%%%%%%%%
Public Const vlASALTO As Integer = 100
Public Const vlASESINO As Integer = 1000
Public Const vlCAZADOR As Integer = 5
Public Const vlNoble As Integer = 5
Public Const vlLadron As Integer = 25
Public Const vlProleta As Integer = 2

'%%%%%%%%%% CONSTANTES DE INDICES %%%%%%%%%%%%%%%
Public Const iCuerpoMuerto As Integer = 8
Public Const iCabezaMuerto As Integer = 500
Public Const iCuerpoMuertoCrimi As Integer = 145
Public Const iCabezaMuertoCrimi As Integer = 501


Public Const iORO As Byte = 12
Public Const Pescado As Byte = 139

Public Enum PECES_POSIBLES
    PESCADO1 = 139
    PESCADO2 = 544
    PESCADO3 = 545
    PESCADO4 = 546
End Enum

'%%%%%%%%%% CONSTANTES DE INDICES %%%%%%%%%%%%%%%
Public Enum eSkill
    Suerte = 1
    Magia = 2
    Robar = 3
    Tacticas = 4
    Armas = 5
    Meditar = 6
    Apu�alar = 7
    Ocultarse = 8
    Supervivencia = 9
    Talar = 10
    comerciar = 11
    Defensa = 12
    Pesca = 13
    Mineria = 14
    Carpinteria = 15
    Herreria = 16
    Liderazgo = 17
    Domar = 18
    Proyectiles = 19
    Wresterling = 20
    Navegacion = 21
End Enum

Public Const FundirMetal = 88

Public Enum eAtributos
    Fuerza = 1
    Agilidad = 2
    Inteligencia = 3
    Carisma = 4
    Constitucion = 5
End Enum

Public Const AdicionalHPGuerrero As Byte = 2 'HP adicionales cuando sube de nivel
Public Const AdicionalHPCazador As Byte = 1 'HP adicionales cuando sube de nivel

Public Const AumentoSTDef As Byte = 15
Public Const AumentoSTLadron As Byte = AumentoSTDef + 3
Public Const AumentoSTMago As Byte = AumentoSTDef - 1
Public Const AumentoSTLe�ador As Byte = AumentoSTDef + 23
Public Const AumentoSTPescador As Byte = AumentoSTDef + 20
Public Const AumentoSTMinero As Byte = AumentoSTDef + 25

'Tama�o del mapa
Public Const XMaxMapSize As Byte = 100
Public Const XMinMapSize As Byte = 1
Public Const YMaxMapSize As Byte = 100
Public Const YMinMapSize As Byte = 1

'Tama�o del tileset
Public Const TileSizeX As Byte = 32
Public Const TileSizeY As Byte = 32

'Tama�o en Tiles de la pantalla de visualizacion
Public Const XWindow As Byte = 17
Public Const YWindow As Byte = 13

'Sonidos
Public Const SND_SWING As Byte = 2
Public Const SND_TALAR As Byte = 13
Public Const SND_PESCAR As Byte = 14
Public Const SND_MINERO As Byte = 15
Public Const SND_WARP As Byte = 3
Public Const SND_PUERTA As Byte = 5
Public Const SND_NIVEL As Byte = 6

Public Const SND_USERMUERTE As Byte = 11
Public Const SND_IMPACTO As Byte = 10
Public Const SND_IMPACTO2 As Byte = 12
Public Const SND_LE�ADOR As Byte = 13
Public Const SND_FOGATA As Byte = 14
Public Const SND_AVE As Byte = 21
Public Const SND_AVE2 As Byte = 22
Public Const SND_AVE3 As Byte = 34
Public Const SND_GRILLO As Byte = 28
Public Const SND_GRILLO2 As Byte = 29
Public Const SND_SACARARMA As Byte = 25
Public Const SND_ESCUDO As Byte = 37
Public Const MARTILLOHERRERO As Byte = 41
Public Const LABUROCARPINTERO As Byte = 42
Public Const SND_BEBER As Byte = 46

''
' Cantidad maxima de objetos por slot de inventario
Public Const MAX_INVENTORY_OBJS As Integer = 10000

''
' Cantidad de "slots" en el inventario
Public Const MAX_INVENTORY_SLOTS As Byte = 20
'[MaTeO 5]
Public Const MAX_INVENTORY_SLOTS_NPC As Byte = 30
'[/MaTeO 5]
' CATEGORIAS PRINCIPALES
Public Enum eOBJType
    otUseOnce = 1
    otWeapon = 2
    otArmadura = 3
    otArboles = 4
    otGuita = 5
    otPuertas = 6
    otCONTENEDORES = 7
    otCARTELES = 8
    otLlaves = 9
    otFOROS = 10
    otPociones = 11
    otBebidas = 13
    otLe�a = 14
    otFogata = 15
    otESCUDO = 16
    otCASCO = 17
    otHerramientas = 18
    otTELEPORT = 19
    otYacimiento = 22
    otMinerales = 23
    otPergaminos = 24
    otInstrumentos = 26
    otYunque = 27
    otFragua = 28
    otBarcos = 31
    otMontura = 66
    otFlechas = 32
    otBotellaVacia = 33
    otBotellaLlena = 34
    otMANCHAS = 35          'No se usa
    otPARAA = 36
      '[MaTeO 9]
    otAlas = 37
    '[/MaTeO 9]
    otPLATA = 77
    otCualquiera = 1000
End Enum

'Texto
Public Const FONTTYPE_TALK As String = "~255~255~255~0~0"
Public Const FONTTYPE_TURQ As String = "~5~205~216~0~0"
Public Const fonttype_HABLAR As String = "~6~159~60~0~0"
Public Const FONTTYPE_FIGHT As String = "~206~4~4~1~0"
Public Const FONTTYPE_WARNING As String = "~54~69~245~1~0"
Public Const FONTTYPE_WARNIN As String = "~4~249~90~0~0"
Public Const FONTTYPE_INFO As String = "~65~190~156~0~0"
Public Const FONTTYPE_APU As String = "~77~238~238~1~0"
Public Const FONTTYPE_INFON As String = "~65~190~156~1~0"
Public Const FONTTYPE_INFOBOLD As String = "~65~190~156~1~0"
Public Const FONTTYPE_EJECUCION As String = "~199~32~7~1~0"
Public Const FONTTYPE_PARTY As String = "~255~180~255~0~0"
Public Const FONTTYPE_VENENO As String = "~0~255~0~1~0"
Public Const FONTTYPE_CHEAT As String = "~77~198~36~1~0"
Public Const FONTTYPE_GUILD As String = "~255~255~255~1~0"
Public Const FONTTYPE_TALKMSG As String = "~244~244~244~1~0"
Public Const FONTTYPE_DENUNCIAR As String = "~200~168~147~0~0"
Public Const FONTTYPE_SERVER As String = "~199~200~209~0~0"
Public Const FONTTYPE_GUILDMSG As String = "~228~199~27~0~0"
Public Const FONTTYPE_CONSEJO As String = "~106~181~255~1~0"
Public Const FONTTYPE_RETOS As String = "~77~198~36~0~"
Public Const FONTTYPE_RETOS2V2 As String = "~5~205~216~0~0"
Public Const FONTTYPE_GUERRA As String = "~77~198~36~1~0"
Public Const FONTTYPE_DEATH As String = "~106~181~255~1~0"
Public Const FONTTYPE_PLANTE As String = "~255~128~64~0~"
Public Const FONTTYPE_CONSEJOCAOS As String = "~255~128~54~1~0"
Public Const FONTTYPE_CONSEJOVesA As String = "~106~181~255~1~0"
Public Const FONTTYPE_CONSEJOCAOSVesA As String = "~255~128~64~1~0"
Public Const FONTTYPE_WETAS As String = "~128~128~128~1~0"
Public Const FONTTYPE_ORO As String = "~255~255~0~1~0"
Public Const FONTTYPE_CELESTE_NEGRITA As String = "~132~165~185~1~0"

'Estadisticas
Public Const STAT_MAXELV As Byte = 55
Public Const STAT_MAXHP As Integer = 999
Public Const STAT_MAXSTA As Integer = 999
Public Const STAT_MAXMAN As Integer = 3000
Public Const STAT_MAXHIT_UNDER36 As Byte = 99
Public Const STAT_MAXHIT_OVER36 As Integer = 999
Public Const STAT_MAXDEF As Byte = 99



' **************************************************************
' **************************************************************
' ************************ TIPOS *******************************
' **************************************************************
' **************************************************************

Public Type tHechizo
    nombre As String
    Desc As String
    PalabrasMagicas As String
    
    HechizeroMsg As String
    TargetMsg As String
    PropioMsg As String
    
    Resis As Byte
    
    Tipo As TipoHechizo
    
    WAV As Integer
    FXgrh As Integer
    loops As Byte
    
    SubeHP As Byte
    MinHP As Integer
    MaxHP As Integer
    
    SubeMana As Byte
    MiMana As Integer
    MaMana As Integer
    
    SubeSta As Byte
    MinSta As Integer
    MaxSta As Integer
    
    SubeHam As Byte
    MinHam As Integer
    MaxHam As Integer
    
    SubeSed As Byte
    MinSed As Integer
    MaxSed As Integer
    
    SubeAgilidad As Byte
    MinAgilidad As Integer
    MaxAgilidad As Integer
    
    SubeFuerza As Byte
    MinFuerza As Integer
    MaxFuerza As Integer
    
    SubeCarisma As Byte
    MinCarisma As Integer
    MaxCarisma As Integer
    
    Invisibilidad As Byte
    Paraliza As Byte
    Inmoviliza As Byte
    RemoverParalisis As Byte
    RemoverEstupidez As Byte
    CuraVeneno As Byte
    Envenena As Byte
    Maldicion As Byte
    RemoverMaldicion As Byte
    Bendicion As Byte
    Estupidez As Byte
    Ceguera As Byte
    Revivir As Byte
    Morph As Byte
    Mimetiza As Byte
    RemueveInvisibilidadParcial As Byte
    
    invoca As Byte
    NumNpc As Integer
    Cant As Integer
    
    Materializa As Byte
    ItemIndex As Byte
    
    MinSkill As Integer
    ManaRequerido As Integer

    'Barrin 29/9/03
    StaRequerido As Integer

    Target As TargetType
    
    NeedStaff As Integer
    StaffAffected As Boolean
End Type

    Public Type UserOBJ
        ObjIndex As Integer
        Amount As Integer
        Equipped As Byte
        ProbTirar As Byte
    End Type

Public Type Inventario
    Object(1 To MAX_INVENTORY_SLOTS) As UserOBJ
    WeaponEqpObjIndex As Integer
    WeaponEqpSlot As Byte
    ArmourEqpObjIndex As Integer
    ArmourEqpSlot As Byte
    EscudoEqpObjIndex As Integer
    EscudoEqpSlot As Byte
    CascoEqpObjIndex As Integer
    CascoEqpSlot As Byte
   AlaEqpObjIndex As Integer
    AlaEqpSlot As Byte
    MunicionEqpObjIndex As Integer
    MunicionEqpSlot As Byte
    HerramientaEqpObjIndex As Integer
    HerramientaEqpSlot As Integer
    BarcoObjIndex As Integer
    BarcoSlot As Byte
    NroItems As Integer
End Type
'[MaTeO 5]
Public Type InventarioNPC
    Object(1 To MAX_INVENTORY_SLOTS_NPC) As UserOBJ
    WeaponEqpObjIndex As Integer
    WeaponEqpSlot As Byte
    ArmourEqpObjIndex As Integer
    ArmourEqpSlot As Byte
    EscudoEqpObjIndex As Integer
    EscudoEqpSlot As Byte
    CascoEqpObjIndex As Integer
    CascoEqpSlot As Byte

    MunicionEqpObjIndex As Integer
    MunicionEqpSlot As Byte
    HerramientaEqpObjIndex As Integer
    HerramientaEqpSlot As Integer
    BarcoObjIndex As Integer
    BarcoSlot As Byte
    NroItems As Integer
End Type
'[/MaTeO 5]

Public Type tPartyData
    PIndex As Integer
    RemXP As Double 'La exp. en el server se cuenta con Doubles
    TargetUser As Integer 'Para las invitaciones
End Type

Public Type Position
    x As Integer
    Y As Integer
End Type

Public Type WorldPos
    Map As Integer
    x As Integer
    Y As Integer
End Type

Public Type FXdata
    nombre As String
    GrhIndex As Integer
    Delay As Integer
End Type

'Datos de user o npc
Public Type char
    CharIndex As Integer
    Head As Integer
    Body As Integer
    
    WeaponAnim As Integer
    ShieldAnim As Integer
    CascoAnim As Integer

    '[MaTeO 9]
    Alas As Integer
    '[/MaTeO 9]
    FX As Integer
    loops As Integer
    
    Heading As eHeading
End Type

'Tipos de objetos
Public Type ObjData
    name As String 'Nombre del obj
    
    OBJType As eOBJType 'Tipo enum que determina cuales son las caract del obj
    
    GrhIndex As Integer ' Indice del grafico que representa el obj
    GrhSecundario As Integer
    
    'Solo contenedores
    MaxItems As Integer
    Conte As Inventario
    Apu�ala As Byte
    Pegadoble As Byte
    DosManos As Byte
    
    HechizoIndex As Integer
    
    ForoID As String
    
    MinHP As Integer ' Minimo puntos de vida
    MaxHP As Integer ' Maximo puntos de vida
    
    
    MineralIndex As Integer
    LingoteInex As Integer
    
    
    proyectil As Integer
    Municion As Integer
    
    Crucial As Byte
    Newbie As Integer
    
    'Puntos de Stamina que da
    MinSta As Integer ' Minimo puntos de stamina
    
    'Pociones
    TipoPocion As Byte
    MaxModificador As Integer
    MinModificador As Integer
    DuracionEfecto As Long
    MinSkill As Integer
    LingoteIndex As Integer
    
    MinHIT As Integer 'Minimo golpe
    MaxHIT As Integer 'Maximo golpe
    
    MinHam As Integer
    MinSed As Integer
    
    def As Integer
    MinDef As Integer ' Armaduras
    MaxDef As Integer ' Armaduras
    
    Ropaje As Integer 'Indice del grafico del ropaje
    
    WeaponAnim As Integer ' Apunta a una anim de armas
    ShieldAnim As Integer ' Apunta a una anim de escudo
    CascoAnim As Integer
   '[MaTeO 9]
    Alas As Integer
    '[/MaTeO 9]
    
    Valor As Long     ' Precio
    
    Cerrada As Integer
    Llave As Byte
    clave As Long 'si clave=llave la puerta se abre o cierra
    
    IndexAbierta As Integer
    IndexCerrada As Integer
    IndexCerradaLlave As Integer
    
    RazaEnana As Byte
    Mujer As Byte
    Hombre As Byte
    
    Envenena As Byte
    Paraliza As Byte
    
    Agarrable As Byte
    
    LingH As Integer
    LingO As Integer
    LingP As Integer
    Madera As Integer
    
    SkHerreria As Integer
    SkCarpinteria As Integer
    
    texto As String
    
    'Clases que no tienen permitido usar este obj
    ClaseProhibida(1 To NUMCLASES) As String
    
    Snd1 As Integer
    Snd2 As Integer
    Snd3 As Integer
    
    Real As Integer
    Caos As Integer
    
    NoSeCae As Integer
    
    StaffPower As Integer
    VaraDragon As Byte
  
    StaffDamageBonus As Integer
    DefensaMagicaMax As Integer
    DefensaMagicaMin As Integer
    Refuerzo As Byte
End Type

Public Type Obj
    ObjIndex As Integer
    Amount As Integer
End Type
Public Type EncZeus
ACT As Byte
Tiempo As Integer
EncSI As Integer
EncNO As Integer
End Type

Public Encuesta As EncZeus
'[KEVIN]
'Banco Objs
Public Const MAX_BANCOINVENTORY_SLOTS As Byte = 40
'[/KEVIN]

'[KEVIN]
Public Type BancoInventario
    Object(1 To MAX_BANCOINVENTORY_SLOTS) As UserOBJ
    NroItems As Integer
End Type
'[/KEVIN]


'*********************************************************
'*********************************************************
'*********************************************************
'*********************************************************
'******* T I P O S   D E    U S U A R I O S **************
'*********************************************************
'*********************************************************
'*********************************************************
'*********************************************************

Public Type tReputacion 'Fama del usuario
    NobleRep As Double
    BurguesRep As Double
    PlebeRep As Double
    LadronesRep As Double
    BandidoRep As Double
    AsesinoRep As Double
    Promedio As Double
End Type

'Estadisticas de los usuarios
Public Type UserStats
    TrofOro As Byte
    TrofBronce As Byte
    TrofPlata As Byte
    TrofMadera As Byte
    GLD As Long 'Dinero
    Banco As Long
    MET As Integer
    
    
    
        ' puntos
    PuntosTorneo As Integer
    PuntosDeath As Integer
    PuntosRetos As Integer
    PuntosDuelos As Integer
    PuntosPlante As Integer
    PuntosCanje As Integer
    
    MaxHP As Integer
    MinHP As Integer
    
    FIT As Integer
    MaxSta As Integer
    MinSta As Integer
    MaxMAN As Integer
    MinMAN As Integer
    MaxHIT As Integer
    MinHIT As Integer
    
    MaxHam As Integer
    MinHam As Integer
    
    MaxAGU As Integer
    MinAGU As Integer
        
    def As Integer
    Exp As Double
    ELV As Long
    ELU As Long
    UserSkills(1 To NUMSKILLS) As Integer
    UserAtributos(1 To NUMATRIBUTOS) As Integer
    UserAtributosBackUP(1 To NUMATRIBUTOS) As Integer
    UserHechizos(1 To MAXUSERHECHIZOS) As Integer
    UsuariosMatados As Integer
    CriminalesMatados As Integer
    NPCsMuertos As Integer
    
    SkillPts As Integer
    
End Type
Public AodefConv As AoDefenderConverter
Public SuperClave As String
'Flags
Public Type UserFlags
    '[MaTeO 13]
    TiempoMapa As Long
    '[/MaTeO 13]
PuedeSumon As Boolean
envioSol As Boolean
Potea As Boolean
Soporteo As Boolean
    RecibioSol As Boolean
    compa As Integer
    EnDosVDos As Boolean
    ParejaMuerta As Boolean
Montado As Boolean
NumeroMont As Integer
VotEnc As Boolean
    EsperandoDuelo As Boolean
    EsperandoDuelo1 As Boolean
    EstaDueleando As Boolean
    EstaDueleando1 As Boolean
    automatico As Boolean


    
    
    bandas As Boolean
    demonio As Boolean
    angel As Boolean
    
    death As Boolean
    Oponente As Integer
    Oponente1 As Integer
    EstaEmpo As Byte    'Empollando (by yb)
    Muerto As Byte '�Esta muerto?
    Escondido As Byte '�Esta escondido?
    Comerciando As Boolean '�Esta comerciando?
    UserLogged As Boolean '�Esta online?
    Meditando As Boolean
    Descuento As String
    Hambre As Byte
    Sed As Byte
    PuedeMoverse As Byte
    TimerLanzarSpell As Long
    PuedeTrabajar As Byte
    Envenenado As Byte
    ClienteOK As Boolean 'CHOTS | Comprobacion de cliente
    YaDenuncio As Byte
    Paralizado As Byte
    Estupidez As Byte
    Ceguera As Byte
    Invisible As Byte
    Maldicion As Byte
    Bendicion As Byte
    Oculto As Byte
    Desnudo As Byte
    Descansar As Boolean
    Hechizo As Integer
    TomoPocion As Boolean
    TipoPocion As Byte
    Navegando As Byte
    Seguro As Boolean
    SeguroClan As Boolean
    
    DuracionEfecto As Long
    TargetNPC As Integer ' Npc se�alado por el usuario
    TargetNpcTipo As eNPCType ' Tipo del npc se�alado
    NpcInv As Integer
    
    Ban As Byte
    AdministrativeBan As Byte
    
    TargetUser As Integer ' Usuario se�alado
    
    TargetObj As Integer ' Obj se�alado
    TargetObjMap As Integer
    TargetObjX As Integer
    TargetObjY As Integer
    
    TargetMap As Integer
    TargetX As Integer
    TargetY As Integer
    
    TargetObjInvIndex As Integer
    TargetObjInvSlot As Integer
    
    AtacadoPorNpc As Integer
    AtacadoPorUser As Integer
    
    StatsChanged As Byte
    Privilegios As PlayerType
    EsRolesMaster As Boolean
    
    ValCoDe As String
    
    LastCrimMatado As String
    LastCiudMatado As String
    
    OldBody As Integer
    OldHead As Integer
    AdminInvisible As Byte
    
    '[el oso]
    MD5Reportado As String
    '[/el oso]
    
    '[Barrin 30-11-03]
    TimesWalk As Long
    StartWalk As Long
    CountSH As Long
    '[/Barrin 30-11-03]
    
    '[CDT 17-02-04]
    UltimoMensaje As Byte
    '[/CDT]
    
    NoActualizado As Boolean
    PertAlCons As Byte
    PertAlConsCaos As Byte
    
    Silenciado As Byte
    
    Mimetizado As Byte
    
 
End Type

Public Type UserCounters
    '[MaTeO 10]
    Laberinto As Long
    '[/MaTeO 10]
 maparql As Long
    IdleCount As Long
    AttackCounter As Integer
    HPCounter As Integer
    STACounter As Integer
    Frio As Integer
    COMCounter As Integer
    AGUACounter As Integer
    Veneno As Integer
    Paralisis As Integer
    Ceguera As Integer
    Estupidez As Integer
    Invisibilidad As Integer
    Mimetismo As Integer
    PiqueteC As Long
    Pena As Long
    SendMapCounter As WorldPos
    Pasos As Integer
    AntiSH As Integer
    '[Gonzalo]
    Saliendo As Boolean
    Salir As Integer
    '[/Gonzalo]
    
    'Barrin 3/10/03
    tInicioMeditar As Long
    bPuedeMeditar As Boolean
    'Barrin
    
    TimerLanzarSpell As Long
    TimerPuedeAtacar As Long
    TimerPuedeTrabajar As Long
    TimerUsar As Long
    
  
    Ocultando As Long   ' Unico trabajo no revisado por el centinela
End Type

Public Type tFacciones
    ArmadaReal As Byte
    FuerzasCaos As Byte
    CriminalesMatados As Double
    CiudadanosMatados As Double
    RecompensasReal As Long
    RecompensasCaos As Long
    RecibioExpInicialReal As Byte
    RecibioExpInicialCaos As Byte
    RecibioArmaduraReal As Byte
    RecibioArmaduraCaos As Byte
    Reenlistadas As Byte
End Type

'Tipo de los Usuarios
Public Type User

Lac As TLac
clave2 As Long
clave As String
' soporte
    Pregunta As String
    Respuesta As String
    
    keyDH As String
    MykeySecretDH As String
    autoaim As Boolean
    name As String
    Titulo As String
    ID As Long
    
    esgm As Boolean
    
    showName As Boolean 'Permite que los GMs oculten su nick con el comando /SHOWNAME
    
    modName As String
    Password As String
    
    char As char 'Define la apariencia
    CharMimetizado As char
    OrigChar As char
    
    Desc As String ' Descripcion
    DescRM As String
    
    Clase As String
    Raza As String
    Genero As String
    email As String
    Hogar As String
        
    Invent As Inventario
    
    pos As WorldPos
    
    ConnIDValida As Boolean
    ConnID As Long 'ID
    RDBuffer As String 'Buffer roto
    
    CommandsBuffer As New CColaArray
    ColaSalida As New Collection
    SockPuedoEnviar As Boolean
    
    '[KEVIN]
    BancoInvent As BancoInventario
    '[/KEVIN]
    
    Counters As UserCounters
    
    MascotasIndex(1 To MAXMASCOTAS) As Integer
    MascotasType(1 To MAXMASCOTAS) As Integer
    NroMacotas As Integer
    
    Stats As UserStats
    flags As UserFlags
    
    '[MaTeO ASEDIO]
    Asedio As flagsAsedio
    '[/MaTeO ASEDIO]
    
    NumeroPaquetesPorMiliSec As Long
    BytesTransmitidosUser As Long
    BytesTransmitidosSvr As Long
    
    Reputacion As tReputacion
    
    Faccion As tFacciones
    
    PrevCheckSum As Long
    PacketNumber As Long
    RandomCode As String
    Antichit As String
    
    ip As String
    
     '[Alejo]
    ComUsu As tCOmercioUsuario
    '[/Alejo]
    
    EmpoCont As Byte
    
    GuildIndex As Integer   'puntero al array global de guilds
    FundandoGuildAlineacion As ALINEACION_GUILD     'esto esta aca hasta que se parchee el cliente y se pongan cadenas de datos distintas para cada alineacion
    EscucheClan As Integer
    
    PartyIndex As Integer   'index a la party q es miembro
    PartySolicitud As Integer   'index a la party q solicito
    
    KeyCrypt As Integer
    
    AreasInfo As AreaInfo
    
End Type

'By Espo
Public Type Rank
    UserName As String
    value As Long
End Type

Public Type Ranks
    MaxOro As Rank
    MaxTrofeos As Rank
    MaxUsuariosMatados As Rank
    MaxTorneos As Rank
    MaxDeaths As Rank
    MaxPlantes As Rank
    MaxDuelos As Rank
    MaxRetos As Rank
End Type



'*********************************************************
'*********************************************************
'*********************************************************
'*********************************************************
'**  T I P O S   D E    N P C S **************************
'*********************************************************
'*********************************************************
'*********************************************************
'*********************************************************

Public Type NPCStats
    Alineacion As Integer
    MaxHP As Long
    MinHP As Long
    MaxHIT As Integer
    MinHIT As Integer
    def As Integer
    UsuariosMatados As Integer
End Type

Public Type NpcCounters
    Paralisis As Integer
    TiempoExistencia As Long
End Type

Public Type NPCFlags
    AfectaParalisis As Byte
    GolpeExacto As Byte
    Domable As Integer
    Respawn As Byte
    NPCActive As Boolean '�Esta vivo?
    Follow As Boolean
    Faccion As Byte
    LanzaSpells As Byte
    
    '[KEVIN]
    'DeQuest As Byte
    
    'ExpDada As Long
    ExpCount As Long '[ALEJO]
    '[/KEVIN]
    
    OldMovement As TipoAI
    OldHostil As Byte
    
    AguaValida As Byte
    TierraInvalida As Byte
    
    UseAINow As Boolean
    Sound As Integer
    Attacking As Integer
    AttackedBy As String
    Category1 As String
    Category2 As String
    Category3 As String
    Category4 As String
    Category5 As String
    BackUp As Byte
    RespawnOrigPos As Byte
    
    Envenenado As Byte
    Paralizado As Byte
    Inmovilizado As Byte
    Invisible As Byte
    Maldicion As Byte
    Bendicion As Byte
    
    Snd1 As Integer
    Snd2 As Integer
    Snd3 As Integer
    
    AtacaAPJ As Integer
    AtacaANPC As Integer
    AIAlineacion As e_Alineacion
    AIPersonalidad As e_Personalidad
End Type

Public Type tCriaturasEntrenador
    NpcIndex As Integer
    NpcName As String
    tmpIndex As Integer
End Type

' New type for holding the pathfinding info
Public Type NpcPathFindingInfo
    Path() As tVertice      ' This array holds the path
    Target As Position      ' The location where the NPC has to go
    PathLenght As Integer   ' Number of steps *
    CurPos As Integer       ' Current location of the npc
    TargetUser As Integer   ' UserIndex chased
    NoPath As Boolean       ' If it is true there is no path to the target location
    
    '* By setting PathLenght to 0 we force the recalculation
    '  of the path, this is very useful. For example,
    '  if a NPC or a User moves over the npc's path, blocking
    '  its way, the function NpcLegalPos set PathLenght to 0
    '  forcing the seek of a new path.
    
End Type
' New type for holding the pathfinding info



Public Type npc
    name As String
    char As char 'Define como se vera
    Desc As String
    DescExtra As String

    NPCtype As eNPCType
    Numero As Integer
    
    level As Integer

    InvReSpawn As Byte

    Comercia As Integer
    Target As Long
    TargetNPC As Long
    TipoItems As Integer

    Veneno As Byte

    pos As WorldPos 'Posicion
    Orig As WorldPos
    SkillDomar As Integer

    Movement As TipoAI
    Attackable As Byte
    Hostile As Byte
    PoderAtaque As Long
    PoderEvasion As Long

    Inflacion As Long
    GiveEXP As Long
    GiveGLD As Long
    DefensaMagica As Byte

    Stats As NPCStats
    flags As NPCFlags
    Contadores As NpcCounters
    
    '[MaTeO ASEDIO]
    MurallaEquipo As Byte
    MurallaIndex As Byte
    '[/MaTeO ASEDIO]
    
    Invent As InventarioNPC
    CanAttack As Byte
    
    NroExpresiones As Byte
    Expresiones() As String ' le da vida ;)
    
    NroSpells As Byte
    Spells() As Integer  ' le da vida ;)
    
    '<<<<Entrenadores>>>>>
    NroCriaturas As Integer
    Criaturas() As tCriaturasEntrenador
    MaestroUser As Integer
    MaestroNpc As Integer
    Mascotas As Integer
    
    ' New!! Needed for pathfindig
    PFINFO As NpcPathFindingInfo
    AreasInfo As AreaInfo
End Type

'**********************************************************
'**********************************************************
'******************** Tipos del mapa **********************
'**********************************************************
'**********************************************************
'Tile
Public Type MapBlock
    Blocked As Byte
    Graphic(1 To 4) As Integer
    userindex As Integer
    NpcIndex As Integer
    OBJInfo As Obj
    TileExit As WorldPos
    trigger As eTrigger
End Type

'Info del mapa
Type MapInfo
criatinv As Integer
    NumUsers As Integer
    Music As String
    name As String
    StartPos As WorldPos
    MapVersion As Integer
    Pk As Boolean
    MagiaSinEfecto As Byte
    NoEncriptarMP As Byte
    
    Terreno As String
    Zona As String
    Restringir As String
    BackUp As Byte
End Type

'********** V A R I A B L E S     P U B L I C A S ***********

Public SERVERONLINE As Boolean
Public ULTIMAVERSION As String
Public BackUp As Boolean ' TODO: Se usa esta variable ?

Public ListaRazas(1 To NUMRAZAS) As String
Public Torneo_Clases_Validas(1 To 8) As String
Public Torneo_Alineacion_Validas(1 To 8) As String
Public Torneo_Clases_Validas2(1 To 8) As Integer
Public Torneo_Alineacion_Validas2(1 To 4) As Integer
Public SkillsNames(1 To NUMSKILLS) As String
Public ListaClases(1 To NUMCLASES) As String

Public Const ENDL As String * 2 = vbCrLf
Public Const ENDC As String * 1 = vbNullChar
Public Multexp As Byte
Public recordusuarios As Long

'
'Directorios
'

''
'Ruta base del server, en donde esta el "server.ini"
Public IniPath As String

''
'Ruta base para guardar los chars
Public CharPath As String

''
'Ruta base para los archivos de mapas
Public MapPath As String

''
'Ruta base para los DATs
Public DatPath As String

''
'Bordes del mapa
Public MinXBorder As Byte
Public MaxXBorder As Byte
Public MinYBorder As Byte
Public MaxYBorder As Byte

Public ResPos As WorldPos ' TODO: Se usa esta variable ?

''
'Posicion de comienzo
Public StartPos As WorldPos ' TODO: Se usa esta variable ?

''
'Numero de usuarios actual
Public NumUsers As Integer
Public LastUser As Integer
Public LastChar As Integer
Public NumChars As Integer
Public LastNPC As Integer
Public NumNPCs As Integer
Public NumFX As Integer
Public NumMaps As Integer
Public NumObjDatas As Integer
Public NumeroHechizos As Integer
Public AllowMultiLogins As Byte
Public IdleLimit As Integer
Public MaxUsers As Integer
Public HideMe As Byte
Public LastBackup As String
Public Minutos As String
Public haciendoBK As Boolean
Public Torneo_SumAuto As Integer
Public Torneo_Map As Integer
Public Torneo_X As Integer
Public Torneo_Y As Integer
Public Hay_Torneo As Boolean
'Public Torneo_Clases_Validas() As String
'Public Torneo_Clases_Validas2() As Integer
'Public Torneo_Alineacion_Validas() As String
'Public Torneo_Alineacion_Validas2() As Integer
Public Torneo_Nivel_Minimo As Long
Public Torneo_Nivel_Maximo As Long
Public Torneo_Cantidad As Long
Public Torneo_Inscriptos As Long
Public Oscuridad As Integer
Public NocheDia As Integer
Public PuedeCrearPersonajes As Integer
Public CamaraLenta As Integer
Public ServerSoloGMs As Integer

''
'Esta activada la verificacion MD5 ?
Public MD5ClientesActivado As Byte


Public EnPausa As Boolean
Public EnTesting As Boolean
Public EncriptarProtocolosCriticos As Boolean


'*****************ARRAYS PUBLICOS*************************
Public UserList() As User 'USUARIOS
Public Npclist() As npc 'NPCS
Public MapData() As MapBlock
Public MapInfo() As MapInfo
Public Hechizos() As tHechizo
Public CharList() As Integer
Public ObjData() As ObjData
Public FX() As FXdata
Public SpawnList() As tCriaturasEntrenador
Public ForbidenNames() As String
Public ArmasHerrero() As Integer
Public ArmadurasHerrero() As Integer
Public ObjCarpintero() As Integer
Public MD5s() As String
Public BanIps As New Collection
Public Parties() As clsParty
'*********************************************************

Public Nix As WorldPos
Public Ullathorpe As WorldPos
Public Banderbill As WorldPos
Public Lindos As WorldPos

Public Prision As WorldPos
Public Libertad As WorldPos
Public Ranking As Ranks

Public Ayuda As New cCola
Public Torneo As New cCola
Public SonidosMapas As New SoundMapInfo

Public Declare Function GetTickCount Lib "kernel32" () As Long
Public Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hWnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Public Declare Function writeprivateprofilestring Lib "kernel32" Alias "WritePrivateProfileStringA" (ByVal lpApplicationname As String, ByVal lpKeyname As Any, ByVal lpString As String, ByVal lpfilename As String) As Long
Public Declare Function GetPrivateProfileString Lib "kernel32" Alias "GetPrivateProfileStringA" (ByVal lpApplicationname As String, ByVal lpKeyname As Any, ByVal lpdefault As String, ByVal lpreturnedstring As String, ByVal nsize As Long, ByVal lpfilename As String) As Long

Public Enum e_ObjetosCriticos
    Manzana = 1
    Manzana2 = 2
    ManzanaNewbie = 467
End Enum
