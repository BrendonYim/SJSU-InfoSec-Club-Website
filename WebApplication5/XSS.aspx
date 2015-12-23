<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="XSS.aspx.cs" Inherits="WebApplication5.XSS" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <script>
        $(document).ready(function () {
            alert("Your attack has been sent to your email.")
        });
    </script>
</asp:Content>
