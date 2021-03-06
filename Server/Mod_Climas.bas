Attribute VB_Name = "Mod_Climas"
'******************************************************************************
'Modulo Climas
'******************************************************************************
Option Explicit
'******************************************************************************
'Declaraciones del Tiempo
'******************************************************************************
Public Anochecer As Byte
Public Atardecer As Byte
Public Amanecer As Byte
Public MedioDia As Byte
Public Niebla As Byte
'******************************************************************************
'Constantes de Tiempos
'******************************************************************************
Public Const TiempoMa?ana As Integer = 1
Public Const TiempoDia As Integer = 100
Public Const TiempoTarde As Integer = 250
Public Const TiempoNoche As Integer = 380
Public Const TiempoNeblina As Integer = 9999
'******************************************************************************
'Declaraciones del tiempo usado
'******************************************************************************
Public Clima As String
Public TiempoClima As Integer

'******************************************************************************
'Funciones Del Tiempo:
'******************************************************************************
'Sorteo Del Clima
Public Function SortearClima()
    Dim ClimaElegido As Byte
        ClimaElegido = RandomNumber(1, 12)
            If ClimaElegido = 1 Or 8 Or 12 Then
                Call Ma?ana
                    TiempoClima = (val(TiempoClima) - val(TiempoClima)) + TiempoMa?ana
                    Clima = "Ma?ana"
                Exit Function
            ElseIf ClimaElegido = 2 Or 7 Or 11 Then
                Call Dia
                    TiempoClima = (val(TiempoClima) - val(TiempoClima)) + TiempoDia
                    Clima = "Dia"
                Exit Function
            ElseIf ClimaElegido = 3 Or 6 Or 10 Then
                Call Tarde
                    TiempoClima = (val(TiempoClima) - val(TiempoClima)) + TiempoTarde
                    Clima = "Tarde"
                Exit Function
            ElseIf ClimaElegido = 4 Or 5 Or 9 Then
                Call Noche
                    TiempoClima = (val(TiempoClima) - val(TiempoClima)) + TiempoNoche
                    Clima = "Noche"
                Exit Function
            End If
          Exit Function
End Function
'******************************************************************************
'Poner el Clima en Ma?ana
Public Function Ma?ana()
    If Amanecer = 0 Then
        Call SendData(ToAll, 0, 0, "MA?" & 1)
            Anochecer = 0
                Atardecer = 0
                    Amanecer = 1
                MedioDia = 0
            Niebla = 0
        Clima = "Ma?ana"
    End If
Exit Function
End Function
'******************************************************************************
'Poner el Clima en Dia
Public Function Dia()
    If MedioDia = 0 Then
        Call SendData(ToAll, 0, 0, "MDI" & 1)
            Anochecer = 0
                Atardecer = 0
                    Amanecer = 0
                MedioDia = 1
            Niebla = 0
        Clima = "Dia"
    End If
Exit Function
End Function
'******************************************************************************
'Poner el Clima en Tarde
Public Function Tarde()
    If Atardecer = 0 Then
        Call SendData(ToAll, 0, 0, "TAR" & 1)
            Anochecer = 0
                Atardecer = 1
                    Amanecer = 0
                MedioDia = 0
            Niebla = 0
        Clima = "Tarde"
    End If
Exit Function
End Function
'******************************************************************************
'Poner el Clima en Noche
Public Function Noche()
    If Anochecer = 0 Then
        Call SendData(ToAll, 0, 0, "NUB" & 1)
            Anochecer = 1
                Atardecer = 0
                    Amanecer = 0
                MedioDia = 0
            Niebla = 0
        Clima = "Noche"
    End If
Exit Function
End Function
'******************************************************************************
'Poner el Clima en Niebla
Public Function Neblina()
    If Niebla = 0 Then
        Call SendData(ToAll, 0, 0, "NIE" & 1)
            Anochecer = 0
                Atardecer = 0
                    Amanecer = 0
                MedioDia = 0
            Niebla = 1
        Clima = "Niebla"
    End If
Exit Function
End Function
'******************************************************************************
'******************************************************************************
