Imports System.Data.SqlClient


Public Class VentaCD
    Private cn As New Conexion



    Sub BusquedaSesion(ByVal pass As String, ByVal login As String)
        Dim comando As New SqlCommand("sesion", cn.getCN)
        Dim reader As SqlDataReader
        comando.CommandType = 4
        With comando.Parameters
            .AddWithValue("@login", login)
            .AddWithValue("@pass", pass)
        End With
        reader = comando.ExecuteReader
        If reader.HasRows = True Then
            Form.FromChildHandle("login.vb").Hide()

        Else
            MsgBox("error de valición de usuario")
        End If
        cn.getCN.Close()
    End Sub
End Class
