<%@ Page Title="My Purchases" Language="VB" AutoEventWireup="false" MasterPageFile="~/Masters/Client.Master" CodeBehind="Purchases.aspx.vb" Inherits="BuildMeAProject.Purchases" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="pnlMain" runat="server" CssClass="py-12">
        <asp:Label ID="lblSection" runat="server" Text="MY LIBRARY" CssClass="text-sm font-semibold text-blue-600" />
        <asp:Label ID="lblTitle" runat="server" Text="Purchases" CssClass="mt-2 block text-4xl font-bold tracking-tight" />
        <asp:Label ID="lblDescription" runat="server" Text="Your paid projects and their GitHub repositories." CssClass="mt-3 block text-slate-600" />
        <asp:Label ID="lblMessage" runat="server" CssClass="mt-4 block text-sm text-red-600" />

        <asp:Panel ID="pnlPurchases" runat="server" CssClass="mt-8 space-y-4">
            <asp:Repeater ID="rptPurchases" runat="server">
                <ItemTemplate>
                    <asp:Panel ID="pnlPurchase" runat="server" CssClass="rounded-2xl bg-white p-6 shadow-sm ring-1 ring-slate-200">
                        <asp:Label ID="lblProjectTitle" runat="server" Text='<%# Eval("title") %>' CssClass="block text-xl font-bold" />
                        <asp:Label ID="lblSeller" runat="server" Text='<%# "Sold by " & Eval("sellerName") %>' CssClass="mt-2 block text-sm text-slate-600" />
                        <asp:Label ID="lblAmount" runat="server" Text='<%# "Amount paid: " & Eval("total") %>' CssClass="mt-3 block font-semibold" />
                        <asp:HyperLink ID="lnkGitHub" runat="server" NavigateUrl='<%# GetGitHubUrl(Eval("githubURL")) %>' Visible='<%# Not String.IsNullOrEmpty(GetGitHubUrl(Eval("githubURL"))) %>' Target="_blank" Text="Open GitHub repository" CssClass="mt-5 inline-block rounded-xl bg-blue-600 px-4 py-2 text-sm font-semibold text-white" />
                        <asp:Label ID="lblRepositoryUnavailable" runat="server" Visible='<%# String.IsNullOrEmpty(GetGitHubUrl(Eval("githubURL"))) %>' Text="Repository unavailable" CssClass="mt-5 block text-sm text-slate-400" />
                    </asp:Panel>
                </ItemTemplate>
            </asp:Repeater>
        </asp:Panel>

        <asp:Panel ID="pnlNoPurchases" runat="server" Visible="false" CssClass="mt-8 rounded-2xl bg-white p-8 text-center text-slate-500 shadow-sm ring-1 ring-slate-200">
            <asp:Label ID="lblNoPurchases" runat="server" Text="You do not have any paid projects yet." />
        </asp:Panel>
    </asp:Panel>
</asp:Content>
