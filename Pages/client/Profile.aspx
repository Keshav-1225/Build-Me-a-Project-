<%@ Page Title="My Profile" Language="VB" AutoEventWireup="false" MasterPageFile="~/Masters/Client.Master" CodeBehind="Profile.aspx.vb" Inherits="BuildMeAProject.ClientProfile" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="pnlMain" runat="server" CssClass="mx-auto w-[820px] py-12">
        <asp:Label ID="lblSection" runat="server" Text="ACCOUNT" CssClass="text-sm font-semibold text-blue-600" />
        <asp:Label ID="lblPageTitle" runat="server" Text="Your profile" CssClass="mt-2 block text-4xl font-bold" />
        <asp:Panel ID="pnlProfile" runat="server" CssClass="mt-8 rounded-2xl bg-white p-9 shadow-sm ring-1 ring-slate-200">
            <asp:Panel ID="pnlIdentity" runat="server" CssClass="border-b border-slate-100 pb-7">
                <asp:Label ID="lblProfileName" runat="server" CssClass="block text-xl font-bold" />
                <asp:Label ID="lblProfileEmail" runat="server" CssClass="mt-1 block text-sm text-slate-500" />
            </asp:Panel>

            <asp:ValidationSummary ID="vsProfile" runat="server" ValidationGroup="Profile" CssClass="mt-6 block rounded-xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700" />
            <asp:Label ID="lblMessage" runat="server" CssClass="mt-4 block text-sm font-medium text-red-600" />

            <asp:Panel ID="pnlFields" runat="server" CssClass="mt-8 grid grid-cols-2 gap-6">
                <asp:Panel ID="pnlName" runat="server">
                    <asp:Label ID="lblName" runat="server" Text="Full name" AssociatedControlID="txtName" CssClass="block text-sm font-semibold text-slate-700" />
                    <asp:TextBox ID="txtName" runat="server" CssClass="mt-2 w-full rounded-xl border border-slate-300 px-4 py-3" />
                    <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" ValidationGroup="Profile" Display="Dynamic" Text="Name is required." CssClass="mt-2 block text-sm text-red-600" />
                </asp:Panel>
                <asp:Panel ID="pnlUsername" runat="server">
                    <asp:Label ID="lblUsername" runat="server" Text="Username" AssociatedControlID="txtUsername" CssClass="block text-sm font-semibold text-slate-700" />
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="mt-2 w-full rounded-xl border border-slate-300 px-4 py-3" />
                    <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="txtUsername" ValidationGroup="Profile" Display="Dynamic" Text="Username is required." CssClass="mt-2 block text-sm text-red-600" />
                </asp:Panel>
                <asp:Panel ID="pnlEmail" runat="server">
                    <asp:Label ID="lblEmail" runat="server" Text="Email address" AssociatedControlID="txtEmail" CssClass="block text-sm font-semibold text-slate-700" />
                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="mt-2 w-full rounded-xl border border-slate-300 px-4 py-3" />
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ValidationGroup="Profile" Display="Dynamic" Text="Email is required." CssClass="mt-2 block text-sm text-red-600" />
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ValidationGroup="Profile" Display="Dynamic" ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" Text="Enter a valid email address." CssClass="mt-2 block text-sm text-red-600" />
                </asp:Panel>
                <asp:Panel ID="pnlContact" runat="server">
                    <asp:Label ID="lblContact" runat="server" Text="Contact number" AssociatedControlID="txtContact" CssClass="block text-sm font-semibold text-slate-700" />
                    <asp:TextBox ID="txtContact" runat="server" TextMode="Phone" MaxLength="10" CssClass="mt-2 w-full rounded-xl border border-slate-300 px-4 py-3" />
                    <asp:RequiredFieldValidator ID="rfvContact" runat="server" ControlToValidate="txtContact" ValidationGroup="Profile" Display="Dynamic" Text="Contact number is required." CssClass="mt-2 block text-sm text-red-600" />
                    <asp:RegularExpressionValidator ID="revContact" runat="server" ControlToValidate="txtContact" ValidationGroup="Profile" Display="Dynamic" ValidationExpression="^[0-9]{10}$" Text="Contact number must contain 10 digits." CssClass="mt-2 block text-sm text-red-600" />
                </asp:Panel>
            </asp:Panel>
            <asp:Button ID="btnSaveProfile" runat="server" Text="Save changes" ValidationGroup="Profile" OnClick="btnSaveProfile_Click" CssClass="mt-8 rounded-xl bg-blue-600 px-6 py-3 text-sm font-semibold text-white" />
        </asp:Panel>
    </asp:Panel>
</asp:Content>
