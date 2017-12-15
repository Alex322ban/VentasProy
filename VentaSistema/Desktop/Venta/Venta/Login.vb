
Imports CapaDatos.Conexion

Public Class Login

    Private Sub Login_Load(sender As Object, e As EventArgs) Handles MyBase.Load

    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Login = TextBox1.Text
        pass = TextBox2.Text
    End Sub
End Class