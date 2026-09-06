<%@ Page Title="Edit Request" Language="VB" AutoEventWireup="false" MasterPageFile="~/Masters/Client.Master" CodeBehind="EditRequest.aspx.vb" Inherits="BuildMeAProject.EditRequest" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="pnlMain" runat="server" CssClass="mx-auto w-[820px] py-12">
        <asp:HyperLink ID="lnkBack" runat="server" NavigateUrl="~/Pages/client/MyRequests.aspx" Text="← Back to my requests" CssClass="text-sm font-semibold text-blue-600" />
        <asp:Panel ID="pnlForm" runat="server" CssClass="mt-6 rounded-2xl bg-white p-9 shadow-sm ring-1 ring-slate-200">
            <asp:Label ID="lblTitle" runat="server" Text="Edit request" CssClass="block text-3xl font-bold" />
            <asp:Label ID="lblMessage" runat="server" CssClass="mt-4 block text-sm text-red-600" />

            <asp:Panel ID="pnlFields" runat="server" CssClass="mt-7 space-y-5">
                <asp:Label ID="lblTopic" runat="server" Text="Topic" AssociatedControlID="txtTopic" CssClass="block text-sm font-semibold" />
                <asp:TextBox ID="txtTopic" runat="server" CssClass="mt-2 w-full rounded-xl border border-slate-300 px-4 py-3" />

                <asp:Label ID="lblDescription" runat="server" Text="Description" AssociatedControlID="txtDescription" CssClass="block text-sm font-semibold" />
                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" CssClass="mt-2 h-32 w-full rounded-xl border border-slate-300 px-4 py-3" />

                <asp:Panel ID="pnlDetails" runat="server" CssClass="grid grid-cols-2 gap-5">
                    <asp:Panel ID="pnlTechStack" runat="server">
                        <asp:Label ID="lblTechStack" runat="server" Text="Tech stack" AssociatedControlID="txtTechStack" CssClass="block text-sm font-semibold" />
                        <asp:TextBox ID="txtTechStack" runat="server" CssClass="mt-2 w-full rounded-xl border border-slate-300 px-4 py-3" />
                    </asp:Panel>
                    <asp:Panel ID="pnlBudget" runat="server">
                        <asp:Label ID="lblBudget" runat="server" Text="Budget" AssociatedControlID="txtBudget" CssClass="block text-sm font-semibold" />
                        <asp:TextBox ID="txtBudget" runat="server" TextMode="Number" CssClass="mt-2 w-full rounded-xl border border-slate-300 px-4 py-3" />
                    </asp:Panel>
                    <asp:Panel ID="pnlDeadline" runat="server">
                        <asp:Label ID="lblDeadline" runat="server" Text="Deadline" AssociatedControlID="txtDeadline" CssClass="block text-sm font-semibold" />
                        <asp:TextBox ID="txtDeadline" runat="server" TextMode="Date" CssClass="mt-2 w-full rounded-xl border border-slate-300 px-4 py-3" />
                    </asp:Panel>
                    <asp:Panel ID="pnlStatus" runat="server">
                        <asp:Label ID="lblStatus" runat="server" Text="Status" AssociatedControlID="ddlStatus" CssClass="block text-sm font-semibold" />
                        <asp:DropDownList ID="ddlStatus" runat="server" CssClass="mt-2 w-full rounded-xl border border-slate-300 bg-white px-4 py-3">
                            <asp:ListItem Text="Open" Value="Open" />
                            <asp:ListItem Text="In Progress" Value="In Progress" />
                            <asp:ListItem Text="Completed" Value="Completed" />
                            <asp:ListItem Text="Expired" Value="Expired" />
                        </asp:DropDownList>
                    </asp:Panel>
                </asp:Panel>

                <asp:Panel ID="pnlActions" runat="server" CssClass="flex gap-4 border-t border-slate-100 pt-7">
                    <asp:Button ID="btnSave" runat="server" Text="Save changes" OnClick="btnSave_Click" CssClass="rounded-xl bg-blue-600 px-6 py-3 text-sm font-semibold text-white" />
                    <asp:HyperLink ID="lnkCancel" runat="server" NavigateUrl="~/Pages/client/MyRequests.aspx" Text="Cancel" CssClass="px-4 py-3 text-sm font-semibold text-slate-600" />
                </asp:Panel>
            </asp:Panel>
        </asp:Panel>
    </asp:Panel>
</asp:Content>
