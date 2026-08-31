<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Masters/Admin.Master" CodeBehind="Projects.aspx.vb" Inherits="BuildMeAProject.Projects" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Header -->
    <asp:Panel
        ID="pnlHeader"
        runat="server"
        CssClass="flex justify-between">

        <asp:Panel
            ID="pnlTitle"
            runat="server">

            <asp:Label
                ID="lblPageType"
                runat="server"
                Text="MARKETPLACE"
                CssClass="text-sm font-semibold text-blue-600" />

            <asp:Label
                ID="lblPageTitle"
                runat="server"
                Text="Projects"
                CssClass="mt-2 block text-4xl font-bold" />

        </asp:Panel>

        <!-- Search -->
        <asp:Panel
            ID="pnlSearch"
            runat="server"
            CssClass="flex items-center gap-3">

            <asp:TextBox
                ID="txtSearch"
                runat="server"
                CssClass="w-72 rounded-xl border border-slate-300 px-4 py-3 text-sm"
                Placeholder="Search projects" />

            <asp:Button
                ID="btnSearch"
                runat="server"
                Text="Search"
                CssClass="rounded-xl bg-slate-950 px-5 py-3 text-sm font-semibold text-white hover:bg-slate-800"
                OnClick="btnSearch_Click"
                CausesValidation="false" />
        </asp:Panel>
    </asp:Panel>

    <!-- Projects Table -->
    <asp:Panel
        ID="pnlProjectsTable"
        runat="server"
        CssClass="mt-8 overflow-hidden rounded-2xl bg-white shadow-sm ring-1 ring-slate-200">
        
        <table class="w-full text-left text-sm">
            <thead class="bg-slate-50 text-slate-500">
                <tr>
                    <th class="px-6 py-4">Project</th>
                    <th class="px-6 py-4">Seller</th>
                    <th class="px-6 py-4">Status</th>
                    <th class="px-6 py-4">Actions</th>
                </tr>
            </thead>

            <tbody class="divide-y divide-slate-100">

                <!-- Project List -->
                <asp:Repeater ID="rptProjects" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td class="px-6 py-5 font-semibold">
                                <asp:Label
                                    ID="lblProjectName"
                                    runat="server"
                                    Text= '<%# Eval("title") %>' />
                            </td>
                   
                            <td class="px-6 py-5">
                                <asp:Label
                                    ID="lblProjectSeller"
                                    runat="server"
                                    Text='<%# Eval("seller") %>' />
                            </td>

                            <td class="px-6 py-5">
                                <asp:Label
                                    ID="lblProjectStatus"
                                    runat="server"
                                    Text='<%# Eval("status") %>'
                                    CssClass="inline-flex items-center rounded-full bg-green-100 px-3 py-1 text-xs font-semibold text-green-700" />
                            </td>

                            <td class="px-6 py-5">
                                <asp:ImageButton
                                    ID="ViewBtn"
                                    runat="server"
                                    ImageUrl="~/Assets/Images/view.gif"
                                    OnCommand="ViewBtn_Command"
                                    ToolTip="View Project"
                                    CommandName="ViewBtn"
                                    CommandArgument='<%# Eval("projectID") %>'
                                    Width="34px" />
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>



            </tbody>

        </table>

    </asp:Panel>


    <!-- Message -->

    <asp:Label
        ID="lblMessage"
        runat="server"
        CssClass="mt-4 block text-sm font-medium" />

</asp:Content>
