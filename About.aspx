<%@ Page Title="About" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.vb" Inherits="BuildMeAProject.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title" class="max-w-3xl">
        <p class="text-sm font-semibold uppercase tracking-[0.2em] text-blue-600">About</p>
        <h2 id="title" class="mt-2 text-3xl font-bold tracking-tight text-slate-900"><%: Title %></h2>
        <p class="mt-6 text-lg leading-8 text-slate-600">Your app description page.</p>
        <p class="mt-4 leading-7 text-slate-600">Use this area to provide additional information.</p>
    </main>
</asp:Content>
