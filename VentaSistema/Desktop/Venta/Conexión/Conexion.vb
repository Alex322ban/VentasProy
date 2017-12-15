Imports System.Data
Imports System.Data.SqlClient

Public Class Conexion
    Public cn As New SqlConnection("data source=FCHOQUECOTA\SQLEXPRESS;initial catalog=Venta1; integrated security=yes")
    Public ReadOnly Property getCN As SqlConnection
        Get
            Return cn
        End Get
    End Property
End Class
